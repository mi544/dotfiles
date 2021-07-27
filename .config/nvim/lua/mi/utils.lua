local utils = {}

function utils.findAndReplaceTag(oldTagName, newTagName)
  print('Starting find a replace for' .. oldTagName .. 'to ' .. newTagName)
  -- "<d-button "
  print('Finding "<' .. oldTagName .. ' " ...')
  vim.cmd('Rg "<' .. oldTagName .. ' "')
  -- "<d-button " -> "<DButton "
  print('Replacing and saving ...')
  vim.cmd([[cdo s/<]] .. oldTagName .. [[ /<]] .. newTagName .. [[ / | w]])
  -- "<d-button$"
  print('Finding "<' .. oldTagName .. '$" ...')
  vim.cmd('Rg "<' .. oldTagName .. '$"')
  print('Replacing and saving ...')
  vim.cmd([[cdo s/<]] .. oldTagName .. [[$/<]] .. newTagName .. [[/ | w]])
  -- "<d-button>"
  print('Finding "<' .. oldTagName .. '>" ...')
  vim.cmd('Rg "<' .. oldTagName .. '>"')
  -- "<d-button>" -> "<DButton>"
  print('Replacing and saving ...')
  vim.cmd([[cdo s/<]] .. oldTagName .. [[>/<]] .. newTagName .. [[>/ | w]])
  -- "</d-button>"
  print('Finding "</' .. oldTagName .. '>" ...')
  vim.cmd('Rg "</' .. oldTagName .. '>"')
  -- "</d-button>  -> "</DButton>"
  print('Replacing and saving ...')
  vim.cmd([[cdo s/<\/]] .. oldTagName .. [[>/<\/]] .. newTagName .. [[>/ | w]])
  -- "'d-button'"
  print('Finding "\'' .. oldTagName .. '\'" ...')
  vim.cmd('Rg "\'' .. oldTagName .. '\'"')
  -- "'d-button'  -> "'DButton'"
  print('Replacing and saving ...')
  vim.cmd([[cdo s/']] .. oldTagName .. [['/']] .. newTagName .. [['/ | w]])
  print('Done!')
end

function utils.tagRenameAutomated()
  local tags = {
    {'d-phone-input', 'DPhoneInput'},
    {'d-filter-menu', 'DFilterMenu'},
    {'d-alert', 'DAlert'},
    {'d-button', 'DButton'},
    {'d-button-group', 'DButtonGroup'},
    {'d-chat-message', 'DChatMessage'},
    {'d-chatbox', 'DChatbox'},
    {'d-checkbox', 'DCheckbox'},
    {'d-component-loading', 'DComponentLoading'},
    {'d-dropdown', 'DDropdown'},
    {'d-example', 'DExample'},
    {'d-html', 'DHtml'},
    {'d-icon', 'DIcon'},
    {'d-img', 'DImg'},
    {'d-input', 'DInput'},
    {'d-input-group', 'DInputGroup'},
    {'d-label', 'DLabel'},
    {'d-loading-modal', 'DLoadingModal'},
    {'d-loading-spinner', 'DLoadingSpinner'},
    {'d-modal', 'DModal'},
    {'d-pill', 'DPill'},
    {'d-pillbox', 'DPillbox'},
    {'d-radio-button', 'DRadioButton'},
    {'d-select', 'DSelect'},
    {'d-tab', 'DTab'},
    {'d-textarea', 'DTextarea'},
    {'d-toggle', 'DToggle'},
    {'d-tooltip', 'DTooltip'},
    {'d-click-outside', 'DClickOutside'},
    {'d-agent-card', 'DAgentCard'},
    {'d-auto-complete', 'DAutoComplete'},
    {'d-auto-complete-results', 'DAutoCompleteResults'},
    {'d-favorite-property-icon', 'DFavoritePropertyIcon'},
    {'d-google-auto-complete', 'DGoogleAutoComplete'},
    {'d-hide-property-icon', 'DHidePropertyIcon'},
    {'d-listing-card', 'DListingCard'},
    {'d-quick-search', 'DQuickSearch'},
    {'d-review-card', 'DReviewCard'},
    {'d-review-card-placeholder', 'DReviewCardPlaceholder'},
    {'d-review-slide', 'DReviewSlide'},
  }
  for a = 1, #(tags) do
    utils.findAndReplaceTag(tags[a][1], tags[a][2])
  end
end

function utils.tagRenamePrompt()
  local oldTag = vim.fn.input("Old tag name > ")
  local newTag = vim.fn.input("New tag name > ")
    utils.findAndReplaceTag(oldTag, newTag)
end

return utils
