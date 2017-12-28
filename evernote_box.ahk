#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;by lonelylizard 
;只兼容到6.5版本，后续有时间再看看为什么印象笔记后面的版本不兼容
;新增选中文字根据换行符进行自动序号
;已知bug：更换字体颜色或字体背景颜色会让选中的文字恢复为默认的字体样式。
#Include WinClipAPI.ahk
#Include WinClip.ahk 

OnMessage(0x404,"tipc")
Traytip,提示,印象笔记增强工具正在运行
SetTimer,RemoveTrayTip,2000	
return

RemoveTrayTip:
SetTimer,RemoveTrayTip,off
TrayTip
return

tipc(wParam,lParam,msg,hwnd){
	static WM_USER:=0x400
	static al:=OnMessage(WM_USER+4,"TB_HIDEBUTTON")
	If (lParam=1029){
		MsgBox 印象笔记增强工具By lonelylizard`n`n邮箱:huangjinlong@wo.cn
	}
}

evernoteSokit(fir,end){
	Send ^c
	sleep,100
	t :=WinClip.GetText()
	con=%fir%%t%%end%
	WinClip.Clear()
	WinClip.setHTML(con)
	Send ^v
	Return
}

!y::evernoteSokit("<div style='background-color:#FFF8DC;border-left: 3px solid #80BC41;padding-left: 19px;'>","</div>")
!s::evernoteSokit("<div style='margin:auto;text-align:center;padding:2px;font-weight:bold;background:#8BAAD0;border-radius:5px;color:#FFF;font-size:18px'>","</div>")
!f::Send ^+l
;字体颜色
;橙、蓝、灰、绿、黑，增加黑色的原因是当这个文档之前已经被编辑过而不能直接使用ctrl+z时可以选中按alt+5恢复为默认颜色(黑色)
!*F1::evernoteSokit("<span style='color:#ED7D31;'>","</span>")
!*F2::evernoteSokit("<span style='color:#5B9BD5;'>","</span>")
!*F3::evernoteSokit("<span style='color:#70AD47;'>","</span>")
!*F4::evernoteSokit("<span style='color:#00FF00;'>","</span>")
!*F5::evernoteSokit("<span style='color:#000000;'>","</span>")

;块颜色
;橙色、蓝、回、绿、黑，增加白色的原因同上
!1::evernoteSokit("<span style='background:#FF0000;'>","</span>")
!2::evernoteSokit("<span style='background:#0000FF;'>","</span>")
!3::evernoteSokit("<span style='background:#C0C0C0;'>","</span>")
!4::evernoteSokit("<span style='background:#00FF00;'>","</span>")
!5::evernoteSokit("<span style='background:#FFF;'>","</span>")







