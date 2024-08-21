<?php

if( !function_exists('camelCase') ){
    function camelCase( $string ): string
    {
        return \Illuminate\Support\Str::camel($string);
    }
}
