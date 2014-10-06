/*
 * Ajax.j
 * Image Editor
 *
 * Created by Nickolay Kondratenko <devmarkup@gmail.com>
 * Copyright 2010, EZ Intelligence All rights reserved.
 */

@import <Foundation/CPObject.j>

@implementation Ajax : CPObject
{
	id		ajaxObject;
}

- (id)init
{
	ajaxObject = [self createXMLHttp];
    return self;
}

- (void)get:(JSON)parameters
{
	parameters.async = typeof(parameters.async) == 'undefined' ? true : parameters.async;
	parameters.type = typeof(parameters.type) == 'undefined' ? 'get' : parameters.type;
	parameters.url = typeof(parameters.url) == 'undefined' ? window.location : parameters.url;
	ajaxObject.open(parameters.type, parameters.url, parameters.async);

    if (false)
    {
        ajaxObject.onreadystatechange = function()
        {
            if (ajaxObject.status == 200 && ajaxObject.readyState == 4)
            {
                var sData = ajaxObject.responseText;
                if (typeof parameters.success == 'function')
                    parameters.success(sData);
            }
        };
    }

	ajaxObject.send(null);
	if (true)
	{
		if (ajaxObject.status == 200 && ajaxObject.readyState == 4)
		{
			var sData = ajaxObject.responseText;
			if (typeof parameters.success == 'function')
				parameters.success(sData);
		}
	}
}

- (id)createXMLHttp
{
	if (typeof XMLHttpRequest != "undefined")
	{ ///Normal Browsers
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{ ///Internet Explorer (all versions)
		var aVersions = ["MSXML2.XMLHttp.5.0", "MSXML2.XMLHttp.4.0",
						"MSXML2.XMLHttp.3.0", "MSXML2.XMLHttp",
						"Microsoft.XMLHttp"
						];
		for (var i = 0; i < aVersions.length; i++)
		{
			try
			{
    //     console.log(i);
    //     console.log(window.ActiveXObject);
				// var _oXmlHttp = new ActiveXObject(aVersions[i]);
        var _oXmlHttp;
				return _oXmlHttp;
			}
			catch (oError)
			{
			}
		}
		throw new Error("Can't create XMLHttp object.");
	}
}

@end
