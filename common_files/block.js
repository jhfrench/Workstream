function blocking(nr)
{
	if (Element.visible(nr))
	{
		$($(nr).parentNode).style.listStyleImage='url(images/bullet1.gif)';
		Effect.Shrink(nr);
	}
	else
	{
		$($(nr).parentNode).style.listStyleImage='url(images/bullet2.gif)';
		Effect.Grow(nr);
	}
}

function blockStyle(objectID,styleName)
{
	temp = $(objectID).getElementsByClassName(styleName);
	temp2 = temp.size();
	for (count=0;count<=(temp2-1);count++) 
		{
			blocking(temp[count]);
		}
}

function scroll_and_focus(var1)
{
	new Effect.ScrollTo(var1+'_top');
	var editorinstance = ColdFusion.objectCache[var1];
	var editor = FCKeditorAPI.GetInstance(editorinstance.richtextid);
	editor.InsertHtml(" ");
	return false;
}