<h2>Customer Details</h2>

<strong>Shipping Address</strong><br/>
{$fields.shipping_firstname} {$fields.shipping_lastname} {if $fields.shipping_email}&lt;{$fields.shipping_email}&gt;{/if}<br />
{if $fields.shipping_phone}{$fields.shipping_phone}<br/>{/if}
{if $fields.shipping_address1}{$fields.shipping_address1}<br/>{/if}
{if $fields.shipping_address2}{$fields.shipping_address2}<br/>{/if}
{if $fields.shipping_suburb}{$fields.shipping_suburb}<br/>{/if}
{if $fields.shipping_city}{$fields.shipping_city}<br/>{/if}
{if $fields.shipping_state}{$fields.shipping_state}{/if} {$fields.shipping_postcode}<br/>
{section name=c loop=$countries}{if $countries[c].code|strtoupper==$fields.shipping_country}{$countries[c].name}{/if}{/section}

<br style="clear: both"/>
