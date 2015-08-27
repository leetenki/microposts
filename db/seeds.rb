# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_string(digits)
  str = ""
  digits.times do 
    str += (Random.rand(27) + 65).chr
  end
  return str
end


users = {"akihiro.ito" => "afirimeister@gmail.com", "akinori.kobayashi" => "a.kobayashi2942@edmail.edcc.edu", "akio.matsumura" => "arks1969@gmail.com", "bryant.seiya" => "seiyathesaint@gmail.com", "tenki.lee" => "toukyouniversityoftechnology@gmail.com", "mentor-aoki" => "coa@rokuro.net", "mentor-song" => "taatata.krmx@gmail.com", "daisuke.nagayama" => "daisukenagayama@gmail.com", "mentor-david" => "david.chen@kiramex.com", "eriko.takaoka" => "taka.hachi1123@gmail.com", "fumio.shimamura" => "comm.shimamura@gmail.com", "gaku.wada" => "obusumagaku.1005@gmail.com", "gen.kamata" => "kamagen0426@gmail.com", "mentor-takemae" => "gento.takemae@odecis.org", "support-ueda" => "haruka.ueda@kiramex.com", "hideaki.kadota" => "msg.hidekdt@gmail.com", "mentor-tamaru" => "code.drank@gmail.com", "hideyuki.sakamoto" => "mocha.kerix56411@gmail.com", "hiroshi.makino" => "info@xflow.jpn.com", "hiroyuki.takayama" => "hiroyuki.takayama1985@gmail.com", "hisao.aso" => "hisao.aso@gmail.com", "mentor-takeno" => "jun.takeno@kiramex.com", "jyunko.fujino" => "fjjnmrjn@ya2.so-net.ne.jp", "mentor-shimoda" => "junshimo2@gmail.com", "kaoru.oda" => "oda@valuemix.jp", "katsuhiro.yuzawa" => "katsuhiroyuza1@gmail.com", "katsuki.yumita" => "xamanojakux@gmail.com", "kazumasa.hashimoto" => "kh100187@gmail.com", "support-hoshi" => "kazuyoshi.hoshi@kiramex.com", "kazuyoshi.kawakami" => "m.kazzy2501@gmail.com", "kei.sato" => "sato_sashimi_yf@yahoo.co.jp", "keiya.kanno" => "keiya@kanno.com", "kenichi.osaki" => "hushinomiya@gmail.com", "kenichi.shinagawa" => "kenichi.shinagawa@gmail.com", "koji.kimura" => "den03471@nifty.com", "kosuke.shinozaki" => "kosukeshinozaki@gmail.com", "kou.machida" => "na_6663_240s@yahoo.co.jp", "support-fuseda" => "masaki.fuseda@kiramex.com", "masami.nakashima" => "nakashima.m@gmail.com", "masayasu.goto" => "send2goto@gmail.com", "mentor-murata" => "masayuki.murata@kiramex.com", "mentor-ito-h" => "hirokazu.ito.7@gmail.com", "mentor-kano" => "tom.yuk.g@gmail.com", "mentor-kubota" => "kuboharu2015@gmail.com", "mentor-kurazono" => "eric@allfesta.com", "mentor-namiki" => "ryoichi58410@gmail.com", "mentor-sekinishi" => "k_sekinishi@media-i.biz", "mentor-suzuki" => "vulture0902@yahoo.co.jp", "mentor-tanoue" => "regonn@sonicgarden.jp", "mentor-tokuyama" => "katsuya.m15@gmail.com", "naoko.otsuka" => "goghv1853v@yahoo.co.jp", "naomi.kurahara" => "703kurahara@gmail.com", "mentor-ito" => "kappatousagi777@yahoo.co.jp", "nobue.nishi" => "nobuen@gmail.com", "noriaki.iwamoto" => "rienel1226@gmail.com", "nozomu.kubota" => "nozomu.k@cnxt.jp", "runa.murakami" => "ru.aug02.xxx@gmail.com", "mentor-kim" => "ryeoung.kim@kiramex.com", "mentor-hashimoto" => "ryo.hashimoto@kiramex.com", "ryo.okube" => "ryonz0625@gmail.com", "ryota.suzuki" => "getty2017@gmail.com", "sachiko.takahashi" => "onni0106@gmail.com", "shingo.ryu" => "shingoryu@gmail.com", "shintaro.okubo" => "okubo.s@elivenavi.com", "sho.ueda" => "sho634@icloud.com", "souta.muramatsu" => "webinboxorg@gmail.com", "mentor-sakai" => "cakka-1248@ezweb.ne.jp", "takuya.saito" => "takuya0215sai@gmail.com", "mentor-nagahama" => "mentor.nagahama@gmail.com", "support" => "support@techacademy.jp", "tetsuro.kimura" => "terry.kimura@gmail.com", "toshihisa.fujita" => "toshibo.f@gmail.com", "tsuyoshi.kibe" => "tsuyoshi.kibe@gmail.com", "wataru.onozawa" => "onozawa0820@yahoo.co.jp", "wona.lee" => "wona@jcom.home.ne.jp", "yasutaka.yamada" => "yizeliphone@gmail.com", "yoshikane.ishigami" => "accounting@ibf.sc", "mentor-obara" => "ohayokki@gmail.com", "yuichi.umezu" => "dottobasic673@gmail.com", "yuji.tokunaga" => "ceo_tokunaga@passible.co.jp", "yuki.hara" => "yuki.h.0519@gmail.com", "yuki.nakano" => "yukinakano_2014@depauw.edu", "yuki.takahashi" => "yuki0627@gmail.com", "yuta.kiyama" => "albero.montagna@gmail.com", "mentor-nakanishi" => "you@youcube.jp", "ryo.okube" => "ryonz0625@gmail.com"}

users.each do |key, value|
  User.create(
    :name => key,
    :email => value,
    :country_code => 'JP',
    :state_code => '13',
    :password => random_string(10),
    :profile => random_string(100)
  )  
end


=begin

100.times do |i|
  User.create(
    :name => random_string(10),
    :email => random_string(Random.rand(10)+20) + '@' + random_string(5) + '.' + random_string(3),
    :country_code => 'JP',
    :state_code => '13',
    :password => random_string(10),
    :profile => random_string(100)
  )
end

=end
