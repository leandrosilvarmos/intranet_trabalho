﻿//////////////////// Agenda file for CalendarXP 9.0 /////////////////
// This file is totally configurable. You may remove all the comments in this file to minimize the download size.
/////////////////////////////////////////////////////////////////////

//////////////////// Define agenda events ///////////////////////////
// Usage -- fAddEvent(year, month, day, message, action, bgcolor, fgcolor, bgimg, boxit, html);
// Notice:
// 1. The (year,month,day) identifies the date of the agenda.
// 2. In the action part you can use any javascript statement, or use " " for doing nothing.
// 3. Assign "null" value to action will result in a line-through effect(can't be selected).
// 4. html is the HTML string to be shown inside the agenda cell, usually an <img> tag.
// 5. fgcolor is the font color for the specific date. Setting it to ""(empty string) will make the fonts invisible and the date unselectable.
// 6. bgimg is the url of the background image file for the specific date.
// 7. boxit is a boolean that enables the box effect using the bgcolor when set to true.
// ** REMEMBER to enable respective flags of the gAgendaMask option in the theme, or it won't work.
/////////////////////////////////////////////////////////////////////

// fAddEvent(2003,12,2," Click me to active your email client. ","popup('mailto:any@email.address.org?subject=email subject')","#87ceeb","dodgerblue",null,true);
// fAddEvent(2004,9,23, "Hello World!\nYou can't select me.", null, "#87ceeb", "dodgerblue");




///////////// Dynamic holiday calculations /////////////////////////
// This function provides you a flexible way to make holidays of your own. (It's optional.)
// Once defined, it'll be called every time the calendar engine renders the date cell;
// With the date passed in, just do whatever you want to validate whether it is a desirable holiday;
// Finally you should return an agenda array like [message, action, bgcolor, fgcolor, bgimg, boxit, html] 
// to tell the engine how to render it. (returning null value will make it rendered as default style)
// ** REMEMBER to enable respective flags of the gAgendaMask option in the theme, or it won't work.
////////////////////////////////////////////////////////////////////
function fHoliday(y,m,d) {
	var rE=fGetEvent(y,m,d), r=null;

	// you may have sophisticated holiday calculation set here, following are only simple examples.
	if (m==1&&d==1)
		r=[" 1 de Janeiro, "+y+" \n Feliz Ano Novo! ",gsAction,"#167107","red"];
	else if (m==12&&d==25)
		r=[" 25 de Dezembro, "+y+" \n Feliz Natal! ",gsAction,"#167107","red"];
	else if (m==2&&d==16)
		r=[" 16 de Fevereiro, "+y+" \n Carnaval ",gsAction,"#167107","red"];
	else if (m==4&&d==21)
		r=[" 21 de Marco, "+y+" \n Tiradentes",gsAction,"#167107","red"];
	else if (m==5&&d==1)
		r=[" 01 de Maio, "+y+" \n Dia do Trabalho",gsAction,"#167107","red"];
	else if (m==6&&d==3)
		r=[" 3 de Junho, "+y+" \n Corpus Christi ",gsAction,"#167107","red"];
	else if (m==9&&d==7)
		r=[" 7 de Setembro, "+y+" \n Independencia do Brasil ",gsAction,"#167107","red"];
	else if (m==10&&d==12)
		r=[" 12 de Outubro, "+y+" \n Nossa Senhora Aparecida ",gsAction,"#167107","red"];
	else if (m==11&&d==2)
		r=[" 02 de Novembro, "+y+" \n Finados ",gsAction,"#167107","red"];
	else if (m==11&&d==15)
		r=[" 15 de Novembro, "+y+" \n Proclamacao da Republica ",gsAction,"#167107","red"];
	else if (m==25&&d<25) {
		var date=fGetDateByDOW(y,1,3,1);	// Martin Luther King, Jr. Day is the 3rd Monday of Jan
		if (d==date) r=[" Jan "+d+", "+y+" \n Aniversario Sao Paulo  ",gsAction,"#167107","red"];
	}
	

	
	return rE?rE:r;	// favor events over holidays
}


