require 'application_system_test_case'

class QuestionsTest < ApplicationSystemTestCase
  test 'visiting /ask renders the form' do
    visit ask_url
    assert_selector 'p', text: 'Ask your coach anything'
    take_screenshot
  end

  test 'saying Hello yields a grumpy response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'

    assert_text "I don't care, get dressed and go to work!"
    take_screenshot
  end

  test 'saying I am going to work yields a great response from the coach' do
    visit ask_url
    fill_in 'question', with: 'I am going to work'
    click_on 'Ask'

    assert_text 'Great!'
    take_screenshot
  end

  test 'asking Can I go shopping yields a silly response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Can I go shopping?'
    click_on 'Ask'

    assert_text 'Silly question, get dressed and go to work!'
    take_screenshot
  end

  test 'visiting /answer find link' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'

    assert_selector 'a', text: 'Ask a new question'
    take_screenshot
  end

  test 'link redirect to /ask page' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'

    click_on 'Ask a new question'

    assert_selector 'p', text: 'Ask your coach anything'
    take_screenshot
  end
end
