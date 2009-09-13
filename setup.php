<?php
/**
 *                    Jojo CMS
 *                ================
 *
 * Copyright 2008 Harvey Kane <code@ragepank.com>
 * Copyright 2008 Michael Holt <code@gardyneholt.co.nz>
 *
 * See the enclosed file license.txt for license information (LGPL). If you
 * did not receive this file, see http://www.fsf.org/copyleft/lgpl.html.
 *
 * @author  Harvey Kane <code@ragepank.com>
 * @license http://www.fsf.org/copyleft/lgpl.html GNU Lesser General Public License
 * @link    http://www.jojocms.org JojoCMS
 */

// Shopping Cart Checkout
$data = Jojo::selectRow("SELECT pageid FROM {page} WHERE pg_link = ?", array('jojo_plugin_jojo_cart_checkout_basic'));
if (!$data) {
   echo "Adding <b>Shopping Cart Checkout</b> Page to menu<br />";
   Jojo::insertQuery('INSERT INTO {page} SET pg_title = ?, pg_url = ?, pg_link = ?, pg_order = ?, pg_index = ?, pg_followto = ?, pg_contentcache = ?, pg_mainnav = ?, pg_sitemapnav = ?, pg_xmlsitemapnav = ?, pg_footernav = ?, pg_ssl = ?',
        array("Shopping Cart Checkout", "cart/checkout", "jojo_plugin_jojo_cart_checkout_basic", 0, "no", "no", "no", "no", "no", "no", "no", "yes"));
}
// Remove 'Checkout' from footer navigation
Jojo::updateQuery("UPDATE {page} SET pg_footernav='no' WHERE pg_link='jojo_plugin_jojo_cart_checkout_basic'");

// Enforce pg_ssl
Jojo::updateQuery("UPDATE {page} SET pg_ssl='yes' WHERE pg_link='jojo_plugin_jojo_cart_checkout_basic'");

// Remove 'Checkout' from sitemap
Jojo::updateQuery("UPDATE {page} SET pg_sitemapnav='no' WHERE pg_link='jojo_plugin_jojo_cart_checkout_basic'");
