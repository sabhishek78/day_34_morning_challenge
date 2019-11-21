import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('cal point', () {
    expect(minRemovals("abcde","abc"),2);
    expect(minRemovals("abcde","abcf"),3);
    expect(minRemovals("abcde",""),5);
    expect(minRemovals("","asdf"),4);
    expect(minRemovals("abcde","fox"),8);
    expect(minRemovals("",""),0);
    expect(hammingDistance("eleven","tweleve"),false);
    expect(hammingDistance("read","dear"),2);
    expect(hammingDistance("read","root"),false);
    expect(hammingDistance("read","root"),false);
    expect(hammingDistance("read","eadr"),true);
    expect(hammingDistance("",""),true);
  });
}
