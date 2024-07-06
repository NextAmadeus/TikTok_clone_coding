import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_second/constants/gaps.dart';
import 'package:tiktok_clone_second/constants/sizes.dart';
import 'package:tiktok_clone_second/feature/authentication/birthday_screen.dart';
import 'package:tiktok_clone_second/feature/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  // TextEditingController를 사용하여 비밀번호 입력 필드의 텍스트를 제어
  final TextEditingController _passwordController = TextEditingController();

  // 비밀번호를 저장하는 변수
  String _password = '';
  // 비밀번호 가리기 상태를 저장하는 변수
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    // _passwordController의 텍스트가 변경될 때마다 호출되는 리스너 추가
    _passwordController.addListener(() {
      setState(() {
        // _passwordController의 텍스트를 _password 변수에 저장
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    // _passwordController를 사용하지 않을 때 메모리 누수를 방지하기 위해 dispose 호출
    _passwordController.dispose();
    super.dispose();
  }

  // 비밀번호 유효성 검사 함수
  bool _isPasswordValid() {
    // 비밀번호가 비어있지 않고 길이가 8자 이상인 경우 유효
    return _password.isNotEmpty && _password.length >= 8;
  }

  // 화면 터치 시 키보드를 닫기 위한 함수
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  // 제출 버튼 클릭 시 호출되는 함수
  void _onSubmit() {
    // 비밀번호가 유효하지 않은 경우 함수 종료
    if (!_isPasswordValid()) return;
    // 비밀번호가 유효한 경우 다음 화면으로 이동
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  // 입력 필드를 비우는 함수
  void onClearTap() {
    _passwordController.clear();
  }

  // 비밀번호 가리기 상태를 토글하는 함수
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap, // 화면 터치 시 키보드를 닫기 위해 _onScaffoldTap 함수 호출
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size20 + Sizes.size2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                autocorrect: false,
                obscureText: _obscureText, // 비밀번호 가리기 상태 적용
                controller: _passwordController,
                onEditingComplete: _onSubmit, // 입력 완료 시 _onSubmit 함수 호출
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min, // 변경된 부분: 항상 아이콘을 표시
                    children: [
                      GestureDetector(
                        onTap: () {
                          _passwordController.clear(); // 텍스트 필드를 지움
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h10,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Make it strong!",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v20,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid() ? Colors.green : Colors.grey[400],
                  ),
                  Gaps.h5,
                  const Text("8 to 20 characters")
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => _onSubmit(),
                child: FormButton(
                  disabled: !_isPasswordValid(), // 변경된 부분: 비밀번호 유효성 검사 함수 사용
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
