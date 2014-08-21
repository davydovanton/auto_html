require 'spec_helper'

describe 'Coub' do
  let(:result) { '<iframe src="//coub.com/embed/24qpb?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="640" height="480" frameborder="0" "allowfullscreen"></iframe>' }
  let(:result_with_params) { '<iframe src="//coub.com/embed/24qpb?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="300" height="255" frameborder="1" "allowfullscreen"></iframe>' }

  it { expect(auto_html('http://coub.com/view/24qpb') { coub }).to eq result }
  it { expect(auto_html('http://www.coub.com/view/24qpb') { coub }).to eq result }
  it { expect(auto_html('https://coub.com/view/24qpb') { coub(width: 300, height: 255, frameborder: 1) }).to eq result_with_params }
  it { expect(auto_html('https://coub.com/view/24qpb') { coub }).to eq result }
  it { expect(auto_html('http://coub.com/embed/24qpb') { coub }).to eq result }
end
