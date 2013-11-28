<fieldset>
	<legend>Picture Sets</legend>
	<div
		class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'pictures', 'error')} ">
		<label for="pictures"> <g:message
				code="candidate.pictures.label" default="Pictures" />

		</label>
		<ul class="one-to-many">
			<g:each in="${candidateInstance?.pictures?}" var="p">
				<li><g:link controller="pictureSet" action="show" id="${p.id}">
						${p?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="pictureSet" action="create"
					params="['candidate.id': candidateInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'pictureSet.label', default: 'PictureSet')])}
				</g:link></li>
		</ul>
	</div>
</fieldset>

<br />
<fieldset>
	<legend>Video Sets</legend>
	<div
		class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'videos', 'error')} ">
		<label for="videos"> <g:message code="candidate.videos.label"
				default="Videos" />

		</label>
		<ul class="one-to-many">
			<g:each in="${candidateInstance?.videos?}" var="v">
				<li><g:link controller="videoSet" action="show" id="${v.id}">
						${v?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="videoSet" action="create"
					params="['candidate.id': candidateInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'videoSet.label', default: 'VideoSet')])}
				</g:link></li>
		</ul>

	</div>
</fieldset>