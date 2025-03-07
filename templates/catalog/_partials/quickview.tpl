{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<div id="quickview-modal-{$product.id}-{$product.id_product_attribute}" class="modal fade quickview" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
   <div class="modal-content">
     <div class="modal-header">
      <h1 class="h3 modal-title">{$product.name}</h1>

       <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
         <span aria-hidden="true">&times;</span>
       </button>
     </div>
     <div class="modal-body">
      <div class="row">
        <div class="col-lg-5 col-md-6 d-none d-md-block">
          {block name='product_cover_thumbnails'}
            <div class="card">
              <div class="card-body">
                {if $product.default_image}
                  <img
                    class="rounded img-fluid lazyload"
                    {generateImagesSources image=$product.default_image size='large_default' lazyload=false}
                    width="{$product.default_image.bySize.large_default.width}"
                    height="{$product.default_image.bySize.large_default.height}"
                    {if !empty($product.default_image.legend)}
                      alt="{$product.default_image.legend}"
                      title="{$product.default_image.legend}"
                    {else}
                      alt="{$product.name}"
                    {/if}
                    loading="lazy">
                {else}
                  <img src="{$urls.no_picture_image.bySize.large_default.url}" class="rounded img-fluid" loading="lazy">
                {/if}
              </div>
            </div>
          {/block}
        </div>
        <div class="col-lg-7 col-md-6">
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}
          {block name='product_description_short'}
            <div id="product-description-short">{$product.description_short nofilter}</div>
          {/block}
          {block name='product_buy'}
            <div class="product-actions js-product-actions">
              <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id" class="js-product-customization-id">

                {block name='product_variants'}
                  {include file='catalog/_partials/product-variants.tpl'}
                {/block}

                {block name='product_add_to_cart'}
                  {include file='catalog/_partials/product-add-to-cart.tpl'}
                {/block}

                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                {block name='product_refresh'}{/block}
            </form>
          </div>
        {/block}
        </div>
      </div>
     </div>
   </div>
 </div>
</div>
