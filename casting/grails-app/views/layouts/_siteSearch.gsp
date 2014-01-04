<div id="search">
<g:form url='[controller: "search", action: "index"]' id="searchableForm" name="searchableForm" method="get">
		<g:hiddenField name="suggestQuery" value="true"/>
        <g:textField name="q" value="${params.q}" size="30"/> <input type="submit" value="Search" />
    	</g:form>
</div>