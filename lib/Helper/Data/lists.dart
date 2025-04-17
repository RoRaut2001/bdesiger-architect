import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import '../../Constants/constant_asset.dart';

var services = [
  {
    'title': 'Architectural Floor Plan',
    'image': '',
  },
  {
    'title': 'Architectural 3D Designer',
    'image': '',
  },
  {
    'title': 'Structural Designer',
    'image': '',
  },
  {
    'title': 'Electrical Designer',
    'image': '',
  },
  {
    'title': 'Interior Designer',
    'image': '',
  },
  {
    'title': 'Estimation',
    'image': '',
  },
];

var softwares = [
  {
    'title': 'AutoCad',
    'image': kaCad,
  },
  {
    'title': 'Revit',
    'image': kaRevit,
  },
  {
    'title': 'Sketchup',
    'image': kaSketchup,
  },
  {
    'title': 'D5 Render',
    'image': kaD5,
  },
  {
    'title': 'Enscape',
    'image': kaEnscape,
  },
];

var positions = [
  'Architect',
  '3D Designer/Render',
  'Structural Designer'
];

var signUpTitles = [
  'Let’s get started',
  'Select services you provide',
  "Select the software's do you work",
  'Know more about work process!',
  'Upload your creative documents',
];

var barTitle = [
  "Basic Details filling!",
  "Know about services",
  "Know about software",
  "Take some Q&A",
  "Upload your creative documents",
];

var barProgress = <double>[
  0.10,
  0.35,
  0.50,
  0.75,
  0.95
];


final List<String> iconUrls = [
  'https://drive.google.com/uc?export=view&id=1Xb-XdMPJaaiXvTJtZbvo0-WfOS84B_IY',
  'https://drive.google.com/uc?export=view&id=1Pc5THmCPargOU7LngrwJVR7fDqekz0y7',
  'https://drive.google.com/uc?export=view&id=1SWKpygXw4z9b_zl9xmtP_8VmpHTV64VC',
  'https://drive.google.com/uc?export=view&id=1_dxDo-z3q3igsgfMOXUd3Fj2k8p7_Y7c'
];

final List<Widget> alternateIconsList = [
  Icon(UniconsLine.home_alt),
  Icon(UniconsLine.file_alt),
  Icon(UniconsLine.youtube),
  Icon(UniconsLine.user_circle),
];

final List<String> features = [
  "Earn upto Rs.1000 for every friends of yours that joins BDesigner.",
  "Join our new course launch on ‘How create realistic render in Enscape’."
];

List<String> tasks = [
  "Buy groceries",
  "Complete Flutter project",
  "Workout for 30 minutes",
  "Read a book",
  "Prepare for meeting",
  "Write a blog post",
  "Call a friend",
  "Review pull requests",
  "Plan weekend trip",
  "Update resume"
];