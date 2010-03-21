<?php

$_options[] = array(
    'id'          => 'cart_phone_required',
    'category'    => 'Cart',
    'label'       => 'Phone number required field',
    'description' => 'The phone number is a required field in the checkout process',
    'type'        => 'radio',
    'default'     => 'no',
    'options'     => 'yes,no',
    'plugin'      => 'jojo_cart_checkout_extended'
);