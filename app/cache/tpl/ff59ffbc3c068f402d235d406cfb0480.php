<?php V()->display("public/header.tpl");?>
<?php if(!input('get.sort')):?>
<?php V()->display("carousel.tpl");?>
<?php endif;?>
<?php V()->display("public/articlelist.tpl");?>
<?php V()->display("public/footer.tpl");?>