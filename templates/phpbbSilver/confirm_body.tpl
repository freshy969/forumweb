<div class="confirm_body-tpl">
	<nav class="breadcrumb">
		<ul>
			<li><a href="{U_INDEX}">{L_INDEX}</a></li>
		</ul>
	</nav>

	<section class="message confirm">
		<h1>{MESSAGE_TITLE}</h1>
		<div class="message_text">{MESSAGE_TEXT}</div>
		<form action="{S_CONFIRM_ACTION}" method="post">
			{S_HIDDEN_FIELDS}
			<input type="submit" name="confirm" value="{L_YES}" class="mainoption">
			<input type="submit" name="cancel" value="{L_NO}">
		</form>
	</section>
</div>