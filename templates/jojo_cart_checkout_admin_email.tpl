
Customer Details
================
Shipping Address
  {$fields.shipping_firstname} {$fields.shipping_lastname} {if $fields.shipping_email}<{$fields.shipping_email}>{/if}
{if $fields.shipping_phone}  {$fields.shipping_phone}
{/if}
{if $fields.shipping_address1}  {$fields.shipping_address1}
{/if}
{if $fields.shipping_address2}  {$fields.shipping_address2}
{/if}
{if $fields.shipping_suburb}  {$fields.shipping_suburb}
{/if}
{if $fields.shipping_city}  {$fields.shipping_city}
{/if}
{if $fields.shipping_state}  {$fields.shipping_state}
{/if}
{if $fields.shipping_postcode}  {$fields.shipping_postcode}
{/if}
{section name=c loop=$countries}{if $countries[c].code|strtoupper==$fields.shipping_country}  {$countries[c].name}{/if}{/section}
{if $fields.shipping_special}Special instructions: {$fields.shipping_special}{/if}
