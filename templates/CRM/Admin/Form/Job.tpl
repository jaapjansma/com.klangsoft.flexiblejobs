{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.4                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2013                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}
{* This template is used for adding/configuring Scheduled Jobs.  *}
<h3>{if $action eq 1}{ts}New Scheduled Job{/ts}{elseif $action eq 2}{ts}Edit Scheduled Job{/ts}{elseif $action eq 128}{ts}Execute Scheduled Job{/ts}{else}{ts}Delete Scheduled Job{/ts}{/if}</h3>
<div class="crm-block crm-form-block crm-job-form-block">
 <div class="crm-submit-buttons">{include file="CRM/common/formButtons.tpl" location="top"}</div>

{if $action eq 8}
  <div class="messages status no-popup">
      <div class="icon inform-icon"></div>
        {ts}WARNING: Deleting this Scheduled Job will cause some important site functionality to stop working.{/ts} {ts}Do you want to continue?{/ts}
  </div>
{elseif $action eq 128}
  <div class="messages status no-popup">
      <div class="icon inform-icon"></div>
        {ts}Are you sure you would like to execute this job?{/ts}
  </div>
{else}
  <table class="form-layout-compressed">
    <tr class="crm-job-form-block-name">
        <td class="label">{$form.name.label}</td><td>{$form.name.html}</td>
    </tr>
    <tr class="crm-job-form-block-description">
        <td class="label">{$form.description.label}</td><td>{$form.description.html}</td>
    </tr>
    <tr class="crm-job-form-block-run_frequency">
        <td class="label">{$form.run_frequency.label}</td><td>{$form.run_frequency.html}</td>
    </tr>
    <tr class="crm-job-form-block-api_action">
        <td class="label">{ts}API call:{/ts}</td>
        <td>

        <div id="fname"><br/>
        </div>
        <select name="api_entity" type="text" id="api_entity" class="form-select required">
          {crmAPI entity="Entity" action="get" var="entities" version=3}
          {foreach from=$entities.values item=entity}
            <option value="{$entity}"{if $entity eq $form.api_entity.value} selected="selected"{/if}>{$entity}</option>
          {/foreach}
        </select>
        {$form.api_action.html}

        <div class="description">{ts}Put in the API method name. You need to enter pieces of full API function name as described in the documentation.{/ts}</div>
<script>
{literal}
  function assembleName( ) {

    // dunno yet
    var apiName = "";

    // building prefix
    if( cj('#api_action').val() == '' ) {
      cj('#fname').html( "<em>API name will start appearing here as you type in fields below.</em>" );
      return;
    }

    apiPrefix = 'api'

    // building entity
    var apiEntity = cj('#api_entity').val().replace( /([A-Z])/g, function($1) {
                                                   return $1.toLowerCase();
                                                   });
    // building action
    var apiAction = cj('#api_action').val().replace(/(\_[a-z])/g, function($1) {return $1.toUpperCase().replace('_','');});
    apiName = apiPrefix + '.' + apiEntity + '.' + apiAction;
    cj('#fname').text( apiName );
  }

  // bind to different events to build API name live
  cj(document).ready( function() { assembleName() } );
  cj('#api_entity').change( function() { assembleName() } );
  cj('#api_action').keyup( function() { assembleName() } );

{/literal}
</script>

			</td>
    </tr>
    <tr class="crm-job-form-block-parameters">
      <td class="label">{$form.parameters.label}<br />{docURL page="Managing Scheduled Jobs" resource="wiki"}</td>
			<td>{$form.parameters.html}</td>
    </tr>
    {* begin com.klangsoft.flexiblejobs *}
    <tr class="crm-job-form-block-schedule_at">
        <td class="label">{$form.schedule_at.label}</td>
        <td>{include file="CRM/common/jcalendar.tpl" elementName=schedule_at}<br />
            <div dlass="description">{ts}Do not run this job before this date / time. The run frequency selected above will apply thereafter.{/ts}<br />
              {if $action eq 1}{ts}Leave blank to run as soon as possible.{/ts}{else}{ts}Leave blank to run at next run frequency.{/ts}{/if}
            </div>
        </td>
    </tr>
    {* end com.klangsoft.flexiblejobs *}
    <tr class="crm-job-form-block-is_active">
      <td></td><td>{$form.is_active.html}&nbsp;{$form.is_active.label}</td>
    </tr>
  </table>
{/if}
  <div class="crm-submit-buttons">{include file="CRM/common/formButtons.tpl" location="bottom"}</div>
</div>

