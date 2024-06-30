import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pancake/constants.dart';
import 'package:pancake/riverpod/home_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 7.5.w,
          ),
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [gradientColor1, gradientColor2])),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: 6.5.h,
                    width: 100.w,
                  ),
                  Text(
                    'IsPalindromeApp',
                    style: GoogleFonts.poppins(
                        color: appLabel,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const Divider(
                    color: dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' Request Type :',
                      style: GoogleFonts.poppins(
                          height: 2.5,
                          letterSpacing: 0.1.w,
                          color: label,
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0.6.w),
                    height: 42,
                    width: 85.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black87.withOpacity(0.2),
                            width: 0.3.w),
                        color: transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          duration: const Duration(milliseconds: 250),
                          alignment: ref.watch(homeRiverpod).type() == true
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            width: 42.5.w,
                            decoration: const BoxDecoration(
                                color: dark,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                ref.read(homeRiverpod).changeType(true);
                              },
                              child: SizedBox(
                                width: 42.5.w,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Fake Request',
                                      style: GoogleFonts.poppins(
                                          letterSpacing: 0.1.w,
                                          color:
                                              ref.read(homeRiverpod).type() ==
                                                      true
                                                  ? selectText
                                                  : unSelectText,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                            )),
                            Expanded(
                                child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                ref.read(homeRiverpod).changeType(false);
                              },
                              child: SizedBox(
                                width: 42.5.w,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Real API Request',
                                      style: GoogleFonts.poppins(
                                          letterSpacing: 0.1.w,
                                          color:
                                              ref.read(homeRiverpod).type() ==
                                                      false
                                                  ? selectText
                                                  : unSelectText,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' Request Content :',
                      style: GoogleFonts.poppins(
                          height: 2.5,
                          letterSpacing: 0.1.w,
                          color: label,
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 85.w,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Text(ref.watch(homeRiverpod).strListString,
                        style: GoogleFonts.poppins(fontSize: 15.sp)),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 30,
                        child: FilledButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AddStringDialog();
                                },
                              );
                            },
                            style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 20)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                                backgroundColor: WidgetStatePropertyAll(dark)),
                            child: Text(
                              'Add String',
                              style: GoogleFonts.poppins(
                                  letterSpacing: 0.1.w,
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 30,
                        child: FilledButton(
                            onPressed: () {
                              ref.read(homeRiverpod).clearStrList();
                            },
                            style: const ButtonStyle(
                                side: WidgetStatePropertyAll(
                                    BorderSide(color: dark)),
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 20)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                                backgroundColor:
                                    WidgetStatePropertyAll(transparent)),
                            child: Text(
                              'Clear',
                              style: GoogleFonts.poppins(
                                  color: dark,
                                  letterSpacing: 0.1.w,
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: ref.watch(homeRiverpod).switcher ? 45 : 10,
                  ),
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      switchInCurve: Curves.fastOutSlowIn,
                      switchOutCurve: Curves.easeOut,
                      child: ref.watch(homeRiverpod).switcher
                          ? SizedBox(
                              width: 150,
                              height: 48,
                              child: FilledButton(
                                  onPressed: () async {
                                    ref.read(homeRiverpod).requestSwitch();
                                  },
                                  style: const ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)))),
                                      backgroundColor:
                                          WidgetStatePropertyAll(dark)),
                                  child: Text(
                                    'Request',
                                    style: GoogleFonts.poppins(
                                        letterSpacing: 0.1.w,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )
                          : Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' Response :',
                                        style: GoogleFonts.poppins(
                                            height: 2.5,
                                            letterSpacing: 0.1.w,
                                            color: label,
                                            fontSize: 15.5.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: FilledButton(
                                            onPressed: () async {
                                              ref
                                                  .read(homeRiverpod)
                                                  .resetSwitcher();
                                            },
                                            style: const ButtonStyle(
                                                padding: WidgetStatePropertyAll(
                                                    EdgeInsets.symmetric(
                                                        horizontal: 20)),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8)))),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        dark)),
                                            child: Text(
                                              'Reset',
                                              style: GoogleFonts.poppins(
                                                  letterSpacing: 0.1.w,
                                                  fontSize: 12.5.sp,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                FutureBuilder(
                                    future: ref.read(homeRiverpod).request(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData == false) {
                                        return const Padding(
                                          padding: EdgeInsets.only(top: 28.0),
                                          child: CircularProgressIndicator(
                                            color: dark,
                                          ),
                                        );
                                      }
                                      if (snapshot.data!.isEmpty) {
                                        return const Text('Bir Hata Oluştu');
                                      }
                                      return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            var item = snapshot.data![index];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                        white.withOpacity(0.4),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: ListTile(
                                                  tileColor: white,
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(item.text!,
                                                          style: GoogleFonts.poppins(
                                                              fontSize: 15.sp,
                                                              backgroundColor: item.isPurePalindrome!
                                                                  ? green
                                                                  : item.isPalindrome!
                                                                      ? yellow
                                                                      : null)),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      SizedBox(
                                                        width: 50.w,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'Is Pure Palindrome',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        fontSize:
                                                                            15.sp)),
                                                            SizedBox(
                                                              width: 30,
                                                              child: FittedBox(
                                                                child: Checkbox(
                                                                  shape: const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5))),
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  fillColor: WidgetStateProperty
                                                                      .all(item
                                                                              .isPurePalindrome!
                                                                          ? dark
                                                                          : transparent),
                                                                  checkColor:
                                                                      white,
                                                                  value: item
                                                                      .isPurePalindrome!,
                                                                  onChanged:
                                                                      (value) {},
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 50.w,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'Is Palindrome',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        fontSize:
                                                                            15.sp)),
                                                            SizedBox(
                                                              width: 30,
                                                              child: FittedBox(
                                                                child: Checkbox(
                                                                  shape: const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5))),
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  fillColor: WidgetStateProperty
                                                                      .all(item
                                                                              .isPalindrome!
                                                                          ? dark
                                                                          : transparent),
                                                                  checkColor:
                                                                      white,
                                                                  value: item
                                                                      .isPalindrome!,
                                                                  onChanged:
                                                                      (value) {},
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    }),
                              ],
                            )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddStringDialog extends ConsumerStatefulWidget {
  const AddStringDialog({super.key});

  @override
  ConsumerState<AddStringDialog> createState() => _AddStringDialogState();
}

class _AddStringDialogState extends ConsumerState<AddStringDialog> {
  final TextEditingController _notController = TextEditingController();

  @override
  void dispose() {
    _notController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.only(bottom: 50),
      backgroundColor: white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      actionsPadding: const EdgeInsets.only(bottom: 9),
      contentPadding:
          const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 15),
      actionsAlignment: MainAxisAlignment.center,
      titlePadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 15)
          .copyWith(bottom: 0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add String',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 17.sp),
          ),
          const Divider(
            color: dark,
          )
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
            width: 45.w,
            child: IntrinsicHeight(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 70),
                child: TextField(
                  onChanged: (_) {
                    setState(() {});
                  },
                  controller: _notController,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  style: GoogleFonts.poppins(
                      color: label,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your str here...',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 14.sp),
                  ),
                ),
              ),
            )),
      ),
      actions: <Widget>[
        SizedBox(
          height: 25,
          child: FilledButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(dark),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))))),
            onPressed: () {
              if (_notController.text != "") {
                ref.read(homeRiverpod).addStrList(_notController.text);
                Navigator.pop(context);
              }
            },
            child: Text(
              'Save',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp),
            ),
          ),
        ),
        SizedBox(
          height: 25,
          child: FilledButton(
            style: const ButtonStyle(
                side: WidgetStatePropertyAll(BorderSide(color: dark)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
                backgroundColor: WidgetStatePropertyAll(transparent)),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                  color: dark, fontWeight: FontWeight.w500, fontSize: 13.sp),
            ),
          ),
        ),
      ],
    );
  }
}
