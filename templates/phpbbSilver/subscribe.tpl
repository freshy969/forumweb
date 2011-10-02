<div class="subscribe-tpl">
	<article>
		<header>{L_TITLE_SIDEBAR}</header>
		<section>
			{L_SIDEBAR_INFO}
		</section>
		<section>
			<input value="{U_SIDEBAR}" readonly />
			[<a href="{U_SIDEBAR}">{L_GO}</a>]
		</section>
	</article>

	<article>
		<header>{L_TITLE_RSS}</header>
		<section>
			{L_RSS_INFO}
		</section>
		<section>
			<input value="{U_RSS}" readonly />
			[<a href="{U_RSS}">{L_GO}</a>]
		</section>
	</article>

	<script type="text/javascript">
	<!--
	////////// SETTINGS
	var panel_title = '{SITENAME}';
	var panel_suffix = '{SUFFIX}';
	//////////


	var forum_url = location.href.substring(0, location.href.lastIndexOf('/')+1);

	function make_URL(URL) {
		URL += (URL.indexOf('?') == -1 ? '?' : '&') +
			(document.sidebar.topics.checked ? 'topics&' : '') + 
			'n=' + document.sidebar.n.value +
			'&m=' + document.sidebar.m.value +
			(URL.indexOf('rss') != -1 ? '&t=' + document.sidebar.t.value : '') +
			'&s=' + document.sidebar.s.value +
			'&l=' + (document.sidebar.l.checked ? 1 : 0) +
			(document.sidebar.u ? '&u=' + document.sidebar.u.value : '');
		
		for (var i = 0, f = ''; i < document.forms['sidebar'].elements.length; i++) {
			if (document.forms['sidebar'].elements[i].name == 'f[]' && document.forms['sidebar'].elements[i].checked) f += ',' + document.forms['sidebar'].elements[i].value;
		}
		if (f != '') URL += '&f=' + f.substring(1);
		
		return URL + panel_suffix;
	}

	function addSidebar(SidebarTag, Title, URL) {
		URL = forum_url + URL;
		
		if ((typeof window.sidebar == "object") && (typeof window.sidebar.addPanel == "function")) { 
			window.sidebar.addPanel(Title, URL, ""); 
			return true; 
		} 
		else if ((navigator.userAgent.indexOf("Opera") != -1) && (navigator.userAgent.indexOf("Opera 5") == -1)) { 
			SidebarTag.setAttribute("title", Title); 
			SidebarTag.setAttribute("href", URL); 
			SidebarTag.setAttribute("rel", "sidebar"); 
			return true; 
		} 
		else if (window.external) {
			window.external.addFavorite(URL, Title);
			return true;
		} 
		else { 
			//alert("Panel jest dost�pny wy��cznie w Mozilli/Netscape 6 lub Operze 6...");
			window.location.href = URL; 
			return false; 
		} 
	}
	//-->
	</script>

	<form action="{S_SUBSCRIBE_ACTION}" name="sidebar">
		<header>{L_ADD_SIDEBAR_RSS}</header>
		<dl>
			<dt>{L_TOPICS_NUMBER}:</dt>
			<dd>
				<select name="n">
					<option value="3" {S_N_3_SELECTED}>3</option>
					<option value="5" {S_N_5_SELECTED}>5</option>
					<option value="10" {S_N_10_SELECTED}>10</option>
					<option value="15" {S_N_15_SELECTED}>15</option>
					<option value="20" {S_N_20_SELECTED}>20</option>
					<option value="25" {S_N_25_SELECTED}>25</option>
					<option value="30" {S_N_30_SELECTED}>30</option>
					<option value="50" {S_N_50_SELECTED}>50</option>
				</select>
			</dd>
			<dt>{L_CHARACTERS_NUMBER}:</dt>
			<dd>
				<select name="m">
					<option value="10" {S_M_10_SELECTED}>10</option>
					<option value="15" {S_M_15_SELECTED}>15</option>
					<option value="20" {S_M_20_SELECTED}>20</option>
					<option value="25" {S_M_25_SELECTED}>25</option>
					<option value="30" {S_M_30_SELECTED}>30</option>
					<option value="40" {S_M_40_SELECTED}>40</option>
					<option value="50" {S_M_50_SELECTED}>50</option>
					<option value="60" {S_M_60_SELECTED}>60</option>
				</select>
			</dd>
			<dt>{L_RSS_CONTENT_LENGTH}:</dt>
			<dd>
				<select name="t">
					<option value="10" {S_T_10_SELECTED}>10</option>
					<option value="25" {S_T_20_SELECTED}>20</option>
					<option value="30" {S_T_30_SELECTED}>30</option>
					<option value="50" {S_T_50_SELECTED}>50</option>
					<option value="100" {S_T_100_SELECTED}>100</option>
					<option value="200" {S_T_200_SELECTED}>200</option>
					<option value="300" {S_T_300_SELECTED}>300</option>
					<option value="500" {S_T_500_SELECTED}>500</option>
					<option value="1000" {S_T_1000_SELECTED}>1000</option>
				</select>
			</dd>
			<dt>{L_REFRESH_TIME}:</dt>
			<dd>
				<select name="s">
					<option value="300" {S_S_300_SELECTED}>5</option>
					<option value="420" {S_S_420_SELECTED}>7</option>
					<option value="600"  {S_S_600_SELECTED}>10</option>
					<option value="900" {S_S_900_SELECTED}>15</option>
					<option value="1200" {S_S_1200_SELECTED}>20</option>
					<option value="1500" {S_S_1500_SELECTED}>25</option>
					<option value="1800" {S_S_1800_SELECTED}>30</option>
					<option value="2700" {S_S_2700_SELECTED}>45</option>
					<option value="3600" {S_S_3600_SELECTED}>60</option>
				</select>
			</dd>
			<dt><label for="label__l">{L_DONT_LOG}:</label></dt>
			<dd><input type="checkbox" id="label__l" name="l" value="1" {S_L_CHECKED} /></dd>
			<dt><label for="label__topics">{L_ONLY_TOPICS}:</label></dt>
			<dd><input type="checkbox" id="label__topics" name="topics" value="1" {S_TOPICS_CHECKED} /></dd>
			<dt>{L_ONLY_SELECTED_FORUMS}:</dt>
			<dd>
				<dl>
	<!-- BEGIN catrow -->
					<dt>{catrow.CAT_TITLE}:</dt>
	<!-- BEGIN forumrow -->
					<dd><input type="checkbox" id="label__f__{catrow.forumrow.FORUM_ID}" name="f[]" value="{catrow.forumrow.FORUM_ID}" {catrow.forumrow.S_F_CHECKED} /> <label for="label__f__{catrow.forumrow.FORUM_ID}">{catrow.forumrow.FORUM_NAME}</label></dd>
	<!-- END forumrow -->
	<!-- END catrow -->
				</dl>
			</dd>
		</dl>
		<footer>
			[<a href="javascript:void(0)" onclick="addSidebar(this, panel_title, make_URL('panel.php'))">{L_ADD_SIDEBAR}</a>]
			<input type="submit" name="rss" value="{L_ADD_RSS}" onclick="window.open(make_URL('panel.php?rss'), 'rss'); return true" />
		</footer>
	</form>
</div>