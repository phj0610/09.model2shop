<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>��ǰ �����ȸ</title>
    <link rel="stylesheet" href="/css/admin.css" type="text/css">
    <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
    
    function fncGetProductList(currentPage) {
        $("#currentPage").val(currentPage);
        $("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
    }
    
    $(function(){
        $(".ct_list_pop td:nth-child(3)").on("click", function(){
            var prodNo = $(this).closest("tr").find('input[name="prodNo"]').val();
            var menu = "${param.menu}";

            // �� ��ǰ �࿡ �ش��ϴ� ���� ID�� �����ɴϴ�.
            var formId = $(this).closest("form").attr("id");

            // �ش� ���� hidden input�� �߰��մϴ�.
            $("#" + formId).append('<input type="hidden" name="prodNo" value="' + prodNo + '">');
            
            // �ش� ���� �����մϴ�.
            $("#" + formId).submit();
            
            // ���ο� URL�� �̵��մϴ�.
            self.location = "/product/getProduct?menu=" + menu + "&prodNo=" + prodNo;
        });
    });

<!--  <a href="/product/${ menuType eq 'manage' ? 'updateProduct' : 'getProduct'}?prodNo=${ product.prodNo }&menu=${param.menu}"  -->
   
</script>




</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<%-- <form name="detailForm" action="/listProduct.do?menu=<%= request.getParameter("menu")%>" method="post">
<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">--%>


<form name= "detailForm">
<table width="100%" height="37" border="0" cellpadding="0"   cellspacing="0">
   <tr>
      <td width="15" height="37">
         <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
      </td>
      <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="93%" class="ct_ttl01">

		 		<c:choose>
		    <c:when test="${param.menu != null && param.menu == 'manage'}">
		        ��ǰ ����
		    </c:when>
		    <c:when test="${param.menu == null || param.menu == 'null' || param.menu == 'search'}">
		        ��ǰ �����ȸ
		    </c:when>
		</c:choose>
 		
 		
               </td>
            </tr>
         </table>
      </td>
      <td width="12" height="37">
         <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      
      <td align="right">
      
      <%--
         <%
      if(search.getSearchCondition() != null) {
      %>
         <select name="searchCondition" class="ct_input_g" style="width:80px">
         	<option value ="0" <%= (searchCondition.equals("0") ? "selected" : "") %>>��ǰ��ȣ</option>
         	<option value ="1" <%= (searchCondition.equals("1") ? "selected" : "") %>>��ǰ��</option>
         	<option value ="2" <%= (searchCondition.equals("2") ? "selected" : "") %>>��ǰ����</option>    
            <%}else{%>
            		<select name="searchCondition" class="ct_input_g" style="width:80px">
            		<option value = "0" >��ǰ��ȣ</option>
            		<option value = "1" >��ǰ��</option>
            		<option value = "2" >��ǰ����</option>
            		
            		<% } %>
             --%>
		            <c:choose>
		    <c:when test="${! empty search.searchCondition}">
		        <select name="searchCondition" class="ct_input_g" style="width:80px">
		            <option value="0" ${search.searchCondition == '0' ? 'selected' : ''}>��ǰ��ȣ</option>
		            <option value="1" ${search.searchCondition == '1' ? 'selected' : ''}>��ǰ��</option>
		            <option value="2" ${search.searchCondition == '2' ? 'selected' : ''}>��ǰ����</option>
		        </select>
		    </c:when>
		    <c:otherwise>
		        <select name="searchCondition" class="ct_input_g" style="width:80px">
		            <option value="0">��ǰ��ȣ</option>
		            <option value="1">��ǰ��</option>
		            <option value="2">��ǰ����</option>
		        </select>
		    </c:otherwise>
		</c:choose>
            
           
<%--         <input type="text" name="searchKeyword" value="<%= searchKeyword %>" class="ct_input_g" style="width:200px; height:19px" />
  --%>        <input type="text" name="searchKeyword" value="${search.searchKeyword  }" class="ct_input_g" style="width:200px; height:19px" />
      </td>
      
      <td align="right" width="70">
         <table border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="17" height="23">
                  <img src="/images/ct_btnbg01.gif" width="17" height="23">
               </td>
               <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
              <!--     <a href="javascript:fncGetProductList(1);">--> 
              �˻�
               </td>
               <td width="14" height="23">
                  <img src="/images/ct_btnbg03.gif" width="14" height="23">
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
    <%--   <td colspan="11" >��ü <%= resultPage.getTotalCount()%>�Ǽ�, ����<%= resultPage.getCurrentPage() %> ������</td>
  --%>    <td colspan="11" >��ü${resultPage.totalCount }�Ǽ�, ����${resultPage.currentPage}  ������</td>
  
   </tr>
   <tr>
      <td class="ct_list_b" width="100">No</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">��ǰ��</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">����</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b">�����</td>   
      <td class="ct_line02"></td>
      <td class="ct_list_b">�������</td>   
   </tr>
   <tr>
      <td colspan="11" bgcolor="808285" height="1"></td>
   </tr>

<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">${ i }</td>
							<td></td>
						<td align="left">
					
						<input type="hidden" name="prodNo" value="${product.prodNo}">
							<!--  <a href="/product/${ menuType eq 'manage' ? 'updateProduct' : 'getProduct'}?prodNo=${ product.prodNo }&menu=${param.menu}" >
       						-->	     ${product.prodName}
       							</td>	
											
						<td></td>
						<td align="left">${product.price }</td>
						<td></td>
						<td align="left">${product.regDate}</td>
						<td></td>
			
						 <td align="left">�����</td>
			             
    </tr>
    <tr>
        <td colspan="11" bgcolor="D6D7D6" height="1"></td>
    </tr>
</c:forEach>
	</table>


<tr>
    <td colspan="11" bgcolor="D6D7D6" height="1"></td>
</tr>


       
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td align="center">
		<input type = "hidden" id="currentPage" name="currentPage" value =""/>
			
			 <div style="text-align: center; margin-top: 10px;">

			
			<jsp:include page="../common/pageNavigator.jsp"/>	
				</div>
       </td>
       
   </tr>
   
</table>

<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>