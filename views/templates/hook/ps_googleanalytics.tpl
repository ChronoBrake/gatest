{**
 * Copyright since 2007 PrestaShop SA and Contributors
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<script async src="https://www.googletagmanager.com/gtag/js?id={$gaAccountId|escape:'htmlall':'UTF-8'}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  {literal}function gtag(){dataLayer.push(arguments);}{/literal}
  gtag('js', new Date());
  gtag(
    'config',
    '{$gaAccountId|escape:'htmlall':'UTF-8'}',
    {ldelim}
      'debug_mode':false
      {if $gaAnonymizeEnabled}, 'anonymize_ip': true{/if}
      {if $userId && !$backOffice}, 'user_id': '{$userId|escape:'htmlall':'UTF-8'}'{/if}
      {if $backOffice && !$trackBackOffice}, 'non_interaction': true, 'send_page_view': false{/if}
    {rdelim}
  );

  gtag('set', 'user_status', '{if $customer.is_logged}Logged-in{else}Logged-out{/if}');
  {if isset($page.page_name) && ($page.page_name == 'product' || $page.page_name == 'category' || $page.page_name == 'module-pm_advancedsearch4-searchresults' || $page.page_name == 'search')}
    {assign var="category1" value=null}
    {assign var="category2" value=null}
    {assign var="category3" value=null}
    {assign var="category4" value=null}

    {if $breadcrumb.count > 1}
      {assign var="category1" value=$breadcrumb.links.1.title|escape:'javascript'}
    {/if}
    {if $breadcrumb.count > 2}
      {assign var="category2" value=$breadcrumb.links.2.title|escape:'javascript'}
    {/if}
    {if $breadcrumb.count > 3}
      {assign var="category3" value=$breadcrumb.links.3.title|escape:'javascript'}
    {/if}
    {if $breadcrumb.count > 4}
      {assign var="category4" value=$breadcrumb.links.4.title|escape:'javascript'}
    {/if}

    gtag('set', {
      {if $category1}'category1': '{$category1}',{/if}
      {if $category2}'category2': '{$category2}',{/if}
      {if $category3}'category3': '{$category3}',{/if}
      {if $category4}'category4': '{$category4}'{/if}
    });


  {/if}
</script>

