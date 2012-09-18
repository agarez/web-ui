// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library('model');

class Model {
  String email;
  String repeatEmail;
  bool agree;

  bool get invalid => !agree || email.isEmpty() || email != repeatEmail;

  Model() : email = "", repeatEmail = "", agree = false;
}
