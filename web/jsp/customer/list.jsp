﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>客户列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/my.js"></script>
<SCRIPT language=javascript>
    // 切换页面
	function changePage(changedPage){
        $("#ipt_currentPage").val(changedPage);
        $("#customerForm").submit();
	}

	// 改变页大小
	function changePageSize(pageSize) {
        $("#customerForm").submit();
    }


</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/customer_list"
		method=post>

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=${pageContext.request.contextPath }/images/new_022.jpg><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：客户管理 &gt; 客户列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<TD>客户名称：</TD>
													<TD><INPUT class=textbox id=sChannel2
														style="WIDTH: 80px" maxLength=50 name="cust_name" value="${param.cust_name}" ></TD>
													<TD><INPUT class=button id=sButton2 type=submit
														value=" 筛选 " ></TD> <%--name=sButton2--%>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>客户名称</TD>
													<TD>客户来源</TD>
													<TD>所属行业</TD>
													<TD>客户级别</TD>
													<TD>地址</TD>
													<TD>手机</TD>
													<TD>操作</TD>
												</TR>
												<%--
													ognl玩法: 不要var参数 和 要var
												--%>
												<%--<c:forEach items="${list}" var="customer">--%>
												<%--#list 在值栈的context部分中取--%>
												<%--<s:iterator value="#list">--%>
												<s:iterator value="#pageBean.data" var="cust">
													<%--ognl玩法--%>
													<TR
															style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD><s:property value="#cust.cust_name"/> </TD>
														<TD><s:property value="#cust.cust_source.dictItemName"/></TD>
														<TD><s:property value="#cust.cust_industry.dictItemName"/></TD>
														<TD><s:property value="#cust.cust_level.dictItemName"/></TD>
														<TD><s:property value="#cust.cust_address"/></TD>
														<TD><s:property value="#cust.cust_phone"/></TD>
														<TD>
															<a href="${pageContext.request.contextPath }/customer_goEditUI?cust_id=<s:property value='#cust.cust_id'/>">修改</a>
															&nbsp;&nbsp;
															<a onclick="return confirm('确认删除?')" href="${pageContext.request.contextPath }/customer_deleteOne?cust_id=<s:property value='#cust.cust_id'/>">删除</a>
														</TD>
													</TR>
												</s:iterator>
												<%--</c:forEach>--%>

											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<%--
									<<<< 分页条
								--%>
								<TR>
									<TD><SPAN id=pagelink>
											<DIV
												style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B>${pageBean.rows}</B>]条记录,[<B>${pageBean.totalPage}</B>]页
												,每页显示
												<select name="pageSize" onchange="changePageSize($(this).val())">
												<s:iterator value="#pageBean.pageSizeSelector" var="ps">
                                                    <option value=<s:property value="#ps"/> <s:if test="#pageBean.pageSize==#ps">selected</s:if>  ><s:property value="#ps"/></option>
												</s:iterator>
												<%--<option value="30" <c:if test="${pageSize==30 }">selected</c:if>>30</option>--%>
												</select>
												条
												[<A href="javascript:void(0)" onclick="changePage(<s:property value='#pageBean.currentPage-1' />)" >前一页</A>]
												<B><s:property value="#pageBean.currentPage"/> </B>
												[<A href="javascript:void(0)" onclick="changePage(<s:property value='#pageBean.currentPage+1' />)">后一页</A>]
												到
												<input id="ipt_currentPage" type="text" size="3" id="page" name="currentPage" value="<s:property value='#pageBean.currentPage'/>" />
												页
												
												<input type="button" value="Go" onclick="changePage()"/>
											</DIV>
									</SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
