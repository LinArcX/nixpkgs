{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "ir-standard-fonts";

  src = fetchFromGitHub {
    owner = "morealaz";
    repo = "ir-standard-fonts";
    rev = "d36727d6c38c23c01b3074565667a2fe231fe18f";
    sha256 = "1ks9q1r1gk2517yfr1fbgrdbgw0w97i4am6jqn5ywpgm2xd03yg1";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/ir-standard-fonts
    cp -v $( find . -name '*.ttf') $out/share/fonts/ir-standard-fonts
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/morealaz/ir-standard-fonts;
    description = "Iran Supreme Council of Information and Communication Technology (SCICT) standard Persian fonts series.";
    license = licenses.unlicense;
    platforms = platforms.all;
    maintainers = [ maintainers.linarcx ];
  };
}
