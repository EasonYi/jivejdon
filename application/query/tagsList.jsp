<%@ page session="false" %>
<%@page isELIgnored="false" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/MultiPagesREST.tld" prefix="MultiPagesREST" %>

<bean:define id="title"  value="分类主题" />
<%@ include file="../common/IncludeTop.jsp" %>

<bean:parameter name="queryType" id="queryType" value=""/>


<logic:present name="tagsListForm">
<logic:greaterThan name="tagsListForm" property="allCount" value="0">

<div class="box">
	
<div class="col-md-4">
<logic:iterate id="threadTag" name="tagsListForm" property="list"  length="2">
<div class="box">	
 <div class="linkblock">	
	<div>
    <a href='<%=request.getContextPath() %>/tags/<bean:write name="threadTag" property="tagID"/>' target="_blank" class="post-tag">
        <bean:write name="threadTag" property="title" />   
    </a>
   &nbsp;&nbsp;
<logic:notEmpty  name="threadTag" property="subscriptionCount" >
<logic:greaterThan name="threadTag" property="subscriptionCount" value="0">
  <a href="<%=request.getContextPath() %>/social/contentfollower.shtml?subscribedId=<bean:write name="threadTag" property="tagID" />&subject=<bean:write name="threadTag" property="title" />" target="_blank"  rel="nofollow" class="whitelink">
  <i class="fa fa-feed"></i>
	  <bean:write name="threadTag" property="subscriptionCount"/>
  </a>
</logic:greaterThan>
</logic:notEmpty>
   &nbsp;&nbsp;
  <a href="<%=request.getContextPath()%>/account/protected/sub/subAction.shtml?subscribeType=2&subscribeId=<bean:write name="threadTag" property="tagID"/>"
 target="_blank" title="当本标签有新内容加入 自动通知我"  rel="nofollow">
    <i class="fa fa-heart"></i>
		</a>
	</div>
	<div id='ajax_tagID=<bean:write name="threadTag" property="tagID"/>' style="width:300px; border:none; overflow:hidden;">
     <script>
         load('/query/tt/${threadTag.tagID}', function(xhr) {
  	       document.getElementById('ajax_tagID=<bean:write name="threadTag" property="tagID"/>').innerHTML = xhr.responseText;
         });
        </script> 
	</div>	
</div>  
</div>
</logic:iterate>
</div>

<div class="col-md-4">
<logic:iterate id="threadTag" name="tagsListForm" property="list"  length="2" offset="2">
<div class="box">	
 <div class="linkblock">	
	<div>
    <a href='<%=request.getContextPath() %>/tags/<bean:write name="threadTag" property="tagID"/>' target="_blank" class="post-tag">
        <bean:write name="threadTag" property="title" />   
    </a>
   &nbsp;&nbsp;
        <logic:notEmpty  name="threadTag" property="subscriptionCount" >
        <logic:greaterThan name="threadTag" property="subscriptionCount" value="0">
  <a href="<%=request.getContextPath() %>/social/contentfollower.shtml?subscribedId=<bean:write name="threadTag" property="tagID" />&subject=<bean:write name="threadTag" property="title" />" target="_blank"  rel="nofollow" class="whitelink">
<i class="fa fa-feed"></i>
	  <bean:write name="threadTag" property="subscriptionCount"/>
  </a>
</logic:greaterThan>
        </logic:notEmpty>
   &nbsp;&nbsp;
  <a href="<%=request.getContextPath()%>/account/protected/sub/subAction.shtml?subscribeType=2&subscribeId=<bean:write name="threadTag" property="tagID"/>"
 target="_blank" title="当本标签有新内容加入 自动通知我"  rel="nofollow">
 <i class="fa fa-heart"></i>
 </a>
	</div>
	<div id='ajax_tagID=<bean:write name="threadTag" property="tagID"/>' style="width:300px; border:none; overflow:hidden;">
       <script>
          load('/query/tt/${threadTag.tagID}', function(xhr) {
  	       document.getElementById('ajax_tagID=<bean:write name="threadTag" property="tagID"/>').innerHTML = xhr.responseText;
         });
        </script> 
     
	</div>	
</div>  
</div>
</logic:iterate>
</div>


<div class="col-md-4">
<logic:iterate id="threadTag" name="tagsListForm" property="list"  length="2" offset="4">
<div class="box">	
 <div class="linkblock">	
	<div>
    <a href='<%=request.getContextPath() %>/tags/<bean:write name="threadTag" property="tagID"/>' target="_blank" class="post-tag">
        <bean:write name="threadTag" property="title" />   
    </a>
   &nbsp;&nbsp;
        <logic:notEmpty  name="threadTag" property="subscriptionCount" >
<logic:greaterThan name="threadTag" property="subscriptionCount" value="0">
  <a href="<%=request.getContextPath() %>/social/contentfollower.shtml?subscribedId=<bean:write name="threadTag" property="tagID" />&subject=<bean:write name="threadTag" property="title" />" target="_blank"  rel="nofollow" class="whitelink">
 <i class="fa fa-feed"></i> 
	  <bean:write name="threadTag" property="subscriptionCount"/>
  </a>
</logic:greaterThan>
        </logic:notEmpty>
   &nbsp;&nbsp;
  <a href="<%=request.getContextPath()%>/account/protected/sub/subAction.shtml?subscribeType=2&subscribeId=<bean:write name="threadTag" property="tagID"/>"
 target="_blank" title="当本标签有新内容加入 自动通知我"  rel="nofollow">
  <i class="fa fa-heart"></i>
 </a>
	</div>
	<div id='ajax_tagID=<bean:write name="threadTag" property="tagID"/>' style="width:300px; border:none; overflow:hidden;">
        <script>
        load('/query/tt/${threadTag.tagID}', function(xhr) {
  	       document.getElementById('ajax_tagID=<bean:write name="threadTag" property="tagID"/>').innerHTML = xhr.responseText;
         });
        </script> 
	</div>	
</div>  
</div>
</logic:iterate>
</div>

</div>
<div class="box">
<div class="tres">        
  
<MultiPagesREST:pager actionFormName="tagsListForm" page="/tags/p"  >
<MultiPagesREST:prev name=" 上一页 " />
<MultiPagesREST:index displayCount="3" />
<MultiPagesREST:next  name=" 下一页 " />
</MultiPagesREST:pager>
      </div>
   
</div>	
</logic:greaterThan>
</logic:present>


<%@ include file="searchInputView.jsp" %>

<%@ include file="queryInputView.jsp" %>
<%@include file="../common/IncludeBottom.jsp"%>