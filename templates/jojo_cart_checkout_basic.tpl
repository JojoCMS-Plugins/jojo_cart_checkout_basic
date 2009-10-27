<div class="jojo_cart">
{if $pg_body}{$pg_body}{/if}
{include file="jojo_cart_test_mode.tpl"}

{if $errors}
<div class="errors">
<p>Please correct the following errors before continuing</p>
<ul>
{foreach from=$errors key=key item=errorMsg}
{if is_numeric($key)}
  <li>{$errorMsg}</li>
{/if}
{/foreach}
</ul>
</div>
{/if}

<form method="post" action="cart/checkout/" class="contact-form">
    <div class="box">
        <h3>Shipping Address</h3>

        <label for="shipping_firstname">First name</label>
        <input type="text" size="20" name="shipping_firstname" id="shipping_firstname" value="{$fields.shipping_firstname}" /> *<br />
{if $errors.shipping_firstname}<span class="error">{$errors.shipping_firstname}</span><br/>{/if}

        <label for="shipping_lastname">Last name</label>
        <input type="text" size="20" name="shipping_lastname" id="shipping_lastname" value="{$fields.shipping_lastname}" /> *<br />
{if $errors.shipping_lastname}<span class="error">{$errors.shipping_lastname}</span><br/>{/if}

        <label for="shipping_email">Email</label>
        <input type="text" size="30" name="shipping_email" id="shipping_email" value="{$fields.shipping_email}" /> *<br />
{if $errors.shipping_email}<span class="error">{$errors.shipping_email}</span><br/>{/if}

        <label for="shipping_country">Country</label>
        <select size="1" name="shipping_country" id="shipping_country" onchange="updateCountry($(this).val(), 'shipping');">
{assign var=found value=false}{section name=c loop=$countries}
            <option value="{$countries[c].code|strtoupper}"{if !$found && $countries[c].code|strtoupper==$fields.shipping_country} selected="selected"{assign var=found value=true}{/if}>{$countries[c].name|escape:'htmlall':$charset}</option>
{/section}
        </select> *<br />
{if $errors.shipping_country}<span class="error">{$errors.shipping_country}</span><br/>{/if}

        <label for="shipping_state">State</label>
        <input type="text" size="20" name="shipping_state" id="shipping_state" value="{$fields.shipping_state}" /><br />
{if $errors.shipping_state}<span class="error">{$errors.shipping_state}</span><br/>{/if}

        <label for="shipping_address1">Address 1</label>
        <input type="text" size="30" name="shipping_address1" id="shipping_address1" value="{$fields.shipping_address1}" /> *<br />
{if $errors.shipping_address1}<span class="error">{$errors.shipping_address1}</span><br/>{/if}

        <label for="shipping_address2">Address 2</label>
        <input type="text" size="30" name="shipping_address2" id="shipping_address2" value="{$fields.shipping_address2}" /><br />
{if $errors.shipping_address2}<span class="error">{$errors.shipping_address2}</span><br/>{/if}

        <label for="shipping_suburb">Suburb</label>
        <input type="text" size="20" name="shipping_suburb" id="shipping_suburb" value="{$fields.shipping_suburb}" /><br />
{if $errors.shipping_suburb}<span class="error">{$errors.shipping_suburb}</span><br/>{/if}

        <label for="shipping_city">City</label>
        <input type="text" size="20" name="shipping_city" id="shipping_city" value="{$fields.shipping_city}" /> *<br />
{if $errors.shipping_city}<span class="error">{$errors.shipping_city}</span><br/>{/if}

        <label for="shipping_postcode">Postcode</label>
        <input type="text" size="10" name="shipping_postcode" id="shipping_postcode" value="{$fields.shipping_postcode}" /> *<br />
{if $errors.shipping_postcode}<span class="error">{$errors.shipping_postcode}</span><br/>{/if}

{jojoHook hook="jojo_cart_extra_fields"}
        <br style="clear: both"/>
        <input type="submit" name="continue" value="Continue"/>
    </div>
</form>
</div>

<script type='text/javascript'>{literal}
    updateCountry($('#billing_country').val(),  'billing');
    updateCountry($('#shipping_country').val(), 'shipping');
{/literal}</script>