<% response.charset="utf-8"%>
<html>
<head>
<title>创建新帖</title>
<link rel="stylesheet" type="text/css" href="../css/istyle.css">
</head>
<body>
<ul>
  <li><b>留言板</b></li>
<br>
  <li><a href="/"><b>在线选课</b></a></li>
</ul>
<div class="lefth">
<form action="./createservice.asp" method="post" accept-charset="ISO-8859-1">
<x>
请选择是否匿名：
</x>
<br>
<select name="unsigned">
<option value="0">False</option>
<option value="1">True</option>
</select>
<br>
<x>
请输入帖子正文：
</x>
<label for="text"></label>
<br>
<textarea id="text" name="text" style="width: 399px; height: 100px; border: 3px solid green; border-radius: 3px;"></textarea>
<br>
<button class="btn" style="vertical-align:middle"><span>提交</span></button>
</form>
<br>
<button class="btn" style="vertical-align:middle;background-color: #555;" onclick="location='./'"><span>取消</span></button>
</div>
<iframe src="../iframe/bottom.html" scrolling="no" frameborder="0" class="ifr"></iframe>
</body>
</html>
