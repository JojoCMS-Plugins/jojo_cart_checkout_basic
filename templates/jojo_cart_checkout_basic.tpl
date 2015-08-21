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

<form id="checkout-form" method="post" action="cart/checkout/" class="contact-form no-ajax form-horizontal" role="form">
     <fieldset>
       <legend>Shipping Address</legend>

        <div class="form-fieldset form-group{if $errors.shipping_firstname} error{/if}">
            <label for="shipping_firstname">First name<span class="required">*</span></label>
            <input class="form-control input text required" type="text" size="20" name="shipping_firstname" maxlength="20" id="shipping_firstname" value="{$fields.shipping_firstname}" />
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_lastname} error{/if}">
        <label for="shipping_lastname">Last name<span class="required">*</span></label>
        <input class="form-control input text required" type="text" size="20" name="shipping_lastname" maxlength="20" id="shipping_lastname" value="{$fields.shipping_lastname}" />
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_email} error{/if}">
        <label for="shipping_email">Email<span class="required">*</span></label>
        <input class="form-control input email required" type="text" size="30" name="shipping_email" maxlength="85" id="shipping_email" value="{$fields.shipping_email}" />
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_phone} error{/if}">
        <label for="shipping_phone">Phone{if $OPTIONS.cart_phone_required=='yes'}<span class="required">*</span>{/if}</label>
        <input class="form-control input text{if $OPTIONS.cart_phone_required=='yes'} required{/if}" type="text" size="20" name="shipping_phone" maxlength="25" id="shipping_phone" value="{if $fields.shipping_phone}{$fields.shipping_phone}{/if}" />
        </div>

         <div class="form-fieldset form-group{if $errors.shipping_country} error{/if}">
       <label for="shipping_country">Country<span class="required">*</span></label>
        <select class="form-control select required" size="1" name="shipping_country" id="shipping_country" onchange="updateCountry($(this).val(), 'shipping');">
{assign var=found value=false}{section name=c loop=$countries}
            <option value="{$countries[c].code|strtoupper}"{if !$found && $countries[c].code|strtoupper==$fields.shipping_country} selected="selected"{assign var=found value=true}{/if}>{$countries[c].name|escape:'htmlall':$charset}</option>
{/section}
        </select>
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_state} error{/if}">
                {if $shippingnostates}<input type="hidden" name="shipping_state" id="shipping_state" value="" />
                {else}<label for="shipping_state">State</label>
                <input class="form-control input text" type="text" name="shipping_state" id="shipping_state" value="{if $fields.shipping_state}{$fields.shipping_state}{/if}" />
                {/if}
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_address1} error{/if}">
        <label for="shipping_address1">Address 1<span class="required">*</span></label>
        <input class="form-control input text required" type="text" size="30" name="shipping_address1" maxlength="35" id="shipping_address1" value="{$fields.shipping_address1}" />
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_address2} error{/if}">
        <label for="shipping_address2">Address 2</label>
        <input class="form-control input text" type="text" size="30" name="shipping_address2" maxlength="35" id="shipping_address2" value="{$fields.shipping_address2}" />
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_suburb} error{/if}">
        <label for="shipping_suburb">Suburb</label>
        <input class="form-control input text" type="text" size="20" name="shipping_suburb" maxlength="35" id="shipping_suburb" value="{$fields.shipping_suburb}" />
        </div>

        <div class="form-fieldset form-group{if $errors.shipping_city} error{/if}">
        <label for="shipping_city">City<span class="required">*</span></label>
        <input class="form-control input text required" type="text" size="20" name="shipping_city" maxlength="35" id="shipping_city" value="{$fields.shipping_city}" />
        </div>

         <div class="form-fieldset form-group{if $errors.shipping_postcode} error{/if}">
       <label for="shipping_postcode">Postcode<span class="required">*</span></label>
        <input class="form-control input text required" type="text" size="10" name="shipping_postcode" id="shipping_postcode" value="{$fields.shipping_postcode}" />
        </div>
{if $OPTIONS.cart_special == 'yes'}
        <div class="form-fieldset form-group{if $errors.shipping_special} error{/if}">
            <label for="shipping_special">Special Instructions</label>
            <textarea class="form-control input textarea" name="shipping_special" id="shipping_special">{$fields.shipping_special}</textarea><br />
        </div>
{/if}
{jojoHook hook="jojo_cart_extra_fields"}{* deprecated: please use the shipping / billing hooks instead *}
{jojoHook hook="jojo_cart_extra_fields_shipping"}
{jojoHook hook="jojo_cart_extra_fields_billing"}
            <div class="from-group">
                <input type="submit" class="btn btn-primary" name="continue" value="Continue"/>
            </div>
    </fieldset>
</form>
</div>

<script type='text/javascript'>{literal}
    updateCountry($('#billing_country').val(),  'billing');
    updateCountry($('#shipping_country').val(), 'shipping');
{/literal}</script>