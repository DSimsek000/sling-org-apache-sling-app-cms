<%-- /*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */ --%>
 <%@include file="/libs/sling-cms/global.jsp"%>
<option value="">Select Config Type</option>
<c:set var="query" value="SELECT * FROM [sling:Component] WHERE [componentType]='SlingCMS-Config' ORDER BY [jcr:title]" />
<c:forEach var="component" items="${sling:findResources(resourceResolver,query,'JCR-SQL2')}">
	<c:choose>
		<c:when test="${fn:startsWith(component.path,'/apps/')}">
			<option value="${sling:encode(fn:substringAfter(component.path,'/apps/'),'HTML_ATTR')}"><sling:encode value="${component.valueMap['jcr:title']}" mode="HTML" /></option>
		</c:when>
		<c:otherwise>
			<option value="${sling:encode(fn:substringAfter(component.path,'/libs/'),'HTML_ATTR')}"><sling:encode value="${component.valueMap['jcr:title']}" mode="HTML" /></option>
		</c:otherwise>
	</c:choose>
</c:forEach>