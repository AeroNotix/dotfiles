#!/usr/bin/env python2

# Copyright (c) 2012 Google Inc. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

""" Unit tests for the ninja.py file. """

import gyp.generator.ninja as ninja
import unittest
import StringIO
import TestCommon


class TestPrefixesAndSuffixes(unittest.TestCase):
  def test_BinaryNamesWindows(self):
    writer = ninja.NinjaWriter('wee', '.', '.', 'ninja.build', 'win')
    spec = { 'target_name': 'wee' }
    self.assertTrue(writer.ComputeOutputFileName(spec, 'executable').
        endswith('.exe'))
    self.assertTrue(writer.ComputeOutputFileName(spec, 'shared_library').
        endswith('.dll'))
    self.assertTrue(writer.ComputeOutputFileName(spec, 'static_library').
        endswith('.lib'))

  def test_BinaryNamesLinux(self):
    writer = ninja.NinjaWriter('wee', '.', '.', 'ninja.build', 'linux')
    spec = {
      'target_name': 'wee'
    }
    self.assertTrue('.' not in writer.ComputeOutputFileName(spec, 'executable'))
    self.assertTrue(writer.ComputeOutputFileName(spec, 'shared_library').
        startswith('lib'))
    self.assertTrue(writer.ComputeOutputFileName(spec, 'static_library').
        startswith('lib'))
    self.assertTrue(writer.ComputeOutputFileName(spec, 'shared_library').
        endswith('.so'))
    self.assertTrue(writer.ComputeOutputFileName(spec, 'static_library').
        endswith('.a'))

if __name__ == '__main__':
  unittest.main()
