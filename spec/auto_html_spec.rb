require 'spec_helper'

describe 'AutoHtml' do
  it 'should be raw input when no filters provided' do
    input = 'Hey check out my blog => http://rors.org'
    expect(auto_html(input){}).to eq input
  end

  it 'should apply simple format filter' do
    input = 'Hey check out my blog => http://rors.org'
    expect(auto_html(input){ simple_format }).to eq "<p>#{input}</p>"
  end

  it 'should apply simple format and image filter' do
    result = '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/></p>'
    expect(
      auto_html('Check the logo: http://rors.org/images/rails.png') { simple_format; image(alt: nil) }
    ).to eq result
  end

  it 'should apply simple format image and link filter' do
    result = '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/>. Visit: <a href="http://rubyonrails.org" >http://rubyonrails.org</a></p>'

    expect(
      auto_html('Check the logo: http://rors.org/images/rails.png. Visit: http://rubyonrails.org') {
        simple_format;
        image(alt: nil);
        link
      }
    ).to eq result
  end

  it 'should return blank if input is blank' do
    expect(
      auto_html('') { simple_format; image(alt: nil); link }
    ).to eq ''
  end

  it 'should not apply simple format if input is nil' do
    expect(
      auto_html(nil) { simple_format; image(alt: nil); link }
    ).to eq ''
  end
end
