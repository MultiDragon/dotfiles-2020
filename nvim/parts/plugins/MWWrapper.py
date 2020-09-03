#!/usr/bin/env python
# -*- coding: utf-8 -*-

import vim
import mwclient
from pynvim.api.common import NvimError

site_object = False
def mw_main():
    try:
        site = vim.eval("g:mw_address")
    except NvimError:
        print("No address given")
        return

    site_split = site.split("://")

    try:
        endpoint = vim.eval("g:mw_endpoint")
    except NvimError:
        endpoint = "/w/"

    global site_object
    site_object = mwclient.Site(site_split[1], scheme = site_split[0], path = endpoint)

    try:
        site_object.login(vim.eval("g:mw_username"), vim.eval("g:mw_password"))
    except NvimError:
        print("No login data provided")
        return
    except mwclient.errors.LoginError:
        print("Wrong login or password")
        return
    print("Success logging in to " + site)

def buffer_set(text):
    vim.current.buffer[:] = text.split("\n")

def mw_get_page(name):
    page = site_object.pages[name]
    if not page.exists:
        buffer_set("<!-- This page doesn't exist -->")
    else:
        buffer_set(page.text())

def mw_save_page(summary):
    name = "/".join(vim.current.buffer.name.split("/")[3:])
    page = site_object.pages[name]
    page.save("\n".join(vim.current.buffer[:]), summary)
    print("Success saving " + name)

if __name__ == "__main__":
    mw_main()
