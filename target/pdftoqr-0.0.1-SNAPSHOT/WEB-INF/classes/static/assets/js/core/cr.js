function active_menu_item(menu, submenu){
	var menuItem = document.getElementById(menu);
	var submenuItem = document.getElementById(submenu);
	$(menuItem).addClass('active');
	$(submenuItem).addClass('active');
	$(submenuItem).parent().parent().addClass('active');
}