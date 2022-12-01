var pageArguments = {};

var HTMLViewController = {
    trySubmit: function(button)
    {
        var computedStyle = window.getComputedStyle(button);
        // Don't use button.type here, since the default type for button is annoyingly "submit".
        // Check for an explicit type attribute value of "submit".
        if (button.getAttribute("type") !== "submit" || computedStyle.visibility === "hidden" || computedStyle.display === "none")
            return false;
        button.click();
        return true;
    },

    // On Mac, the submit button always has the default button look.
    keyDown: function(event)
    {
        if (event.target.tagName === "TEXTAREA" || event.keyIdentifier !== "Enter")
            return;

        var buttons = document.getElementsByTagName("button");
        for (var i = 0; i < buttons.length; ++i) {
            if (HTMLViewController.trySubmit(buttons[i])) {
                event.preventDefault();
                return;
            }
        }

        var inputButtons = document.getElementsByTagName("input");
        for (var i = 0; i < inputButtons.length; ++i) {
            if (HTMLViewController.trySubmit(inputButtons[i])) {
                event.preventDefault();
                return;
            }
        }
    },

    setItemText: function(itemID, value)
    {
        var ele = document.getElementById(itemID);
        if (ele.tagName == "INPUT" || ele.tagName == "SELECT" || ele.tagName == "TEXTAREA")
            ele.value = value;
        else
            ele.innerText = value;
    },

    itemText: function(itemID)
    {
        var ele = document.getElementById(itemID);
        if (ele.tagName == "INPUT" || ele.tagName == "SELECT" || ele.tagName == "TEXTAREA")
            return ele.value;
        else if (ele.firstChild)
            return ele.firstChild.data;
        else return "";
    },

    setItemChecked: function(itemID, value)
    {
        document.getElementById(itemID).checked = value;
    },

    itemChecked: function(itemID)
    {
        return document.getElementById(itemID).checked;
    },

    setItemEnabled: function(itemID, value)
    {
        var item = document.getElementById(itemID);
        item.disabled = !value;
        if (item.parentElement.tagName == "LABEL") {
            if (value)
                item.parentElement.classList.remove("disabled");
            else
                item.parentElement.classList.add("disabled");
        }
    },

    insertOptionInSelect: function(selectID, position, label, value)
    {
        var select = document.getElementById(selectID);
        var option = document.createElement("option");
        option.appendChild(document.createTextNode(label));
        option.value = value;
        select.add(option, select.options[position]);
    },

    appendToSelect: function(itemID, label, itemValue, itemStyle)
    {
        var selectEle = document.getElementById(itemID);
        var o;
        if (label == "")
            o = document.createElement("hr");
        else {
            o = document.createElement("option");
            o.appendChild(document.createTextNode(label));
            o.value = itemValue ? itemValue : selectEle.length;
            o.style.cssText = itemStyle;
        }
        selectEle.add(o, null);
    },

    setSelectIndex: function(itemID, index)
    {
        var selectEle = document.getElementById(itemID);
        selectEle.selectedIndex = index;
    },

    setOptionEnabled: function(selectID, optionIndex, enabled)
    {
        document.getElementById(selectID)[optionIndex].disabled = !enabled;
    },

    indexOfItemWithValue: function(selectID, value)
    {
        var select = document.getElementById(selectID);
        for (var i = 0; i < select.options.length; ++i) {
            if (select.options[i].value == value)
                return i;
        }
        return -1;
    },

    clearSelect: function(itemID)
    {
        var selectEle = document.getElementById(itemID);
        selectEle.removeChildren();
    },

    setWidth: function(width)
    {
        window.resizeTo(width);
    },

    htmlOffsetHeight: function()
    {
        return document.getElementsByTagName("html")[0].offsetHeight;
    },

    addClass: function(itemID, itemClass)
    {
        document.getElementById(itemID).classList.add(itemClass);
    },

    removeClass: function(itemID, itemClass)
    {
        document.getElementById(itemID).classList.remove(itemClass);
    },

    setAttribute: function(itemID, attrName, attrValue)
    {
        document.getElementById(itemID).setAttribute(attrName, attrValue);
    },

    setTitle: function(newTitle)
    {
        document.title = newTitle;
    },

    focusItem: function(itemID)
    {
        var ele = document.getElementById(itemID);
        ele.focus();
        ele.selectionStart = 0;
        ele.selectionEnd = ele.value.length;
    },

    contextMenu: function(event)
    {
        if (event.target.tagName === "TEXTAREA")
            return;

        if (event.target.tagName === "INPUT" && (event.target.type === "password" || event.target.type === "text" || event.target.type == "search"))
            return;

        event.preventDefault();
    },

    pageLoaded: function()
    {
        var query = document.location.search;
        if (query) {
            query = query.substr(1);
            var args = query.split("&");
            for (var i = 0; i < args.length; i++) {
                var nameValue = args[i].split("=");
                pageArguments[nameValue[0]] = nameValue[1];
            }
        }

        document.body.addEventListener("keydown", HTMLViewController.keyDown);
        document.addEventListener("contextmenu", HTMLViewController.contextMenu);

        HTMLViewController.localize();
    },

    UIString: function(string)
    {
        if (window.localizedStrings && string in window.localizedStrings)
            string = window.localizedStrings[string];
        else {
            console.error("Localized string \"" + string + "\" not found.");
            string = "LOCALIZED STRING NOT FOUND";
        }
        return string;
    },

    loadLocalizedStrings: function(controller)
    {
        document.write("<script type='text/javascript' charset='utf-8' src='safari-resource:/WBSLocalizedStrings.js'></" + "script>");
    },

    localize: function()
    {
        var elements = document.getElementsByClassName("l12n");
        for (var i = 0; i < elements.length; ++i)
            elements[i].firstChild.data = HTMLViewController.UIString(elements[i].firstChild.data);
        var toolTipElements = document.getElementsByClassName("l12n-tooltip");
        for (var i = 0; i < toolTipElements.length; ++i)
            toolTipElements[i].title = HTMLViewController.UIString(toolTipElements[i].title);
    }
}

