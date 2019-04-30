<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
 <form method="post" enctype="multipart/form-data">
<!--       <input name='uploads[]' type="file" multiple>-->
<!--       <input type="submit" name="uploadpic" value="上传">-->
                <input type="file" name="image[]"><br>
                <input type="text" name="url[]"><br>
                <input type="file" name="image[]"><br>
                <input type="text" name="url[]"><br>
    <input name="submit" type="submit" value="提交"><br>
  </form>

</body>
</html>