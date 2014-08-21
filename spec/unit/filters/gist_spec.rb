require 'spec_helper'

describe 'Gist' do
  it 'transform' do
    result = '<script type="text/javascript" src="https://gist.github.com/1710276.js"></script>'
    expect(
      auto_html('https://gist.github.com/1710276') { gist }
    ).to eq result
  end

  it 'transform with username' do
    result = '<script type="text/javascript" src="https://gist.github.com/6547840.js"></script>'
    expect(
      auto_html('https://gist.github.com/toctan/6547840') { gist }
    ).to eq result
  end
end
