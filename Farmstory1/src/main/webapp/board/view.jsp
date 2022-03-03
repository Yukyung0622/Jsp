<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.bean.UserBean"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");
	String type = request.getParameter("type");
	
	pageContext.include("./inc/_"+cate+".jsp");
	
	
	// 로그인하지 않고 글목록 요청하면 로그인 페이지로 이동시킴
	if(sessUser == null){
		response.sendRedirect("/Farmstory1/user/proc/login.jsp");
		return; // <-- 프로그램 실행 여기까지
	}
	
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	
	// 글 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	ArticleBean article = dao.selectArticle(no);
	
	// 조회수 +1
	dao.updateArticleHit(article.getNo());
	
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(no);
%>
<section id="board" class="view">
 <link rel="stylesheet" href="/Farmstory1/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    
    	$(function(){
    		
    		// 댓글 삭제
    		$('.commentDelete').click(function(){
    			
    			let isOk = confirm('정말 삭제 하시겠습니까?');
    			
    			if(isOk){
    				return true;	
    			}else{
    				return false;
    			}
    		});
    		
    		// 댓글 수정모드 전환
    		$('.commentModify').click(function(e){
    			e.preventDefault();
    			
    			let tag = $(this);    			
    			let textarea = tag.parent().prev();
    			
    			tag.prev().hide();
    			tag.next().show();
    			tag.hide();
    			
    			textarea.attr('readonly', false).focus();
    			textarea.css({'background':'white', 'outline':'1px solid gray'});
    		});
    		
    		// 댓글 수정완료
    		$('.commentModifyComplete').click(function(e){
    			e.preventDefault();
    			
    			let tag = $(this);    			
    			let textarea = tag.parent().prev();    			 			
    			
    			let content = textarea.val();
    			let id = tag.attr('data-id');
    			
    			let jsonData = {"content": content, "id": id};
    			
    			
    			$.ajax({
    				url: '/Board1/proc/updateComment.jsp',
    				type: 'post',
    				data: jsonData,
    				dataType: 'json',
    				success: function(data){
    					
    					if(data.result == 1){
    						alert('댓글을 수정 했습니다.');
    						// 수정완료 모드로 전환
    						tag.hide();
    						tag.prev().show();
    						tag.prev().prev().show();
    						textarea.attr('readonly', true);
    						textarea.css({'background':'transparent', 'outline':'none'});
    					}
    				}
    			});
    		});
    	});
    
    </script>
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
        </tr>
        <% if(article.getFile() > 0){ %>
        <tr>
            <td>첨부파일</td>
            <td>
                <a href="#">2020년 상반기 매출자료.xls</a>
                <span>7회 다운로드</span>
            </td>
        </tr>
         <% } %>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" readonly><%= article.getContent() %></textarea>
            </td>
        </tr>
     
    </table>
    <div>
        <a href="#" class="btnDelete">삭제</a>
        <a href="/Farmstory1/board/modify.jsp?cate=<%= cate %>&type=<%= type %>" class="btnModify">수정</a>
        <a href="/Farmstory1/board/list.jsp?cate=<%= cate %>&type=<%= type %>" class="btnList">목록</a>
    </div>  
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
         <% for(ArticleBean comment : comments){ %>
        <article class="comment">
            <span>
                <span><%= comment.getNick() %></span>
                <span><%= comment.getRdate().substring(2, 10) %></span>
            </span>
            <textarea name="comment" readonly><%= comment.getContent() %></textarea>
            <% if(sessUser.getUid().equals(comment.getUid())){ %>
            <div>
                <a href="#">삭제</a>
                <a href="#">수정</a>
                 <a href="#" data-id="<%= comment.getNo() %>" class="commentModifyComplete">수정완료</a>
            </div>
            <% } %>
        </article>
         <% } %>
         <% if(comments.size() == 0){ %>
        	<p class="empty">
            		등록된 댓글이 없습니다.
        	</p>
       	<% } %>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="#">
            <textarea name="comment"></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>
</section>

<!-- 내용 끝 -->
</article>
</section>
</div>

<%@ include file ="../_footer.jsp" %>