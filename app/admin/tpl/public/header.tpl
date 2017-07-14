<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>后台页面</title>
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/owl.carousel.min.css"/>
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/owl.theme.default.min.css"/>
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/admin.css"/>
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/font-awesome/css/font-awesome.min.css">
</head>

<body>
<div class="wrapper">
    <header class="header">
    </header>
    <div class="left">
        <div class="menu">
            <ul class="nav">
                {foreach getAdminMenu() as $key=>$values}
                    <li class="item">
                        <a href="{if $values['link']=='#'}'#'{else}__HOME__/admin/index/{$values['link']}{/if}">
                            <i class="fa fa-caret-down icon-w"></i>
                            {$values['title']}
                            <i class="{$values['class']}"></i>
                        </a>
                        <ul class="sub-nav{:inMenu(input('action'),($sub=getAdminMenu($values['id'])))?' now':''}">
                            {foreach $sub as $subKey=>$subValues}
                                <li class="item">
                                    <a href="__HOME__/admin/index/{$subValues['link']}">
                                    {$subValues['title']}
                                    <i class="{$subValues['class']}"></i>
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
    <div class="content">
