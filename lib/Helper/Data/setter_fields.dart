
import 'package:get/get_rx/src/rx_types/rx_types.dart';

/**** Is Size Config Initialized ****/
bool _isSizeInitialized = false;
bool get isSizeInitialized => _isSizeInitialized;
void setIsSizeInitialized(bool isSizeInitialized){
  _isSizeInitialized = isSizeInitialized;
}
/**** index for routing ****/

RxInt index = 0.obs;


RxList<Map<String, String>> yourAccountSupport = [
  {
    "title": "Architect Related Queries",
    "question": "Can we speak to a consultant before buying the services?",
    "answer": "Yes"
  },
  {
    "title": "Architect Related Queries",
    "question": "When does a architect get involved in the process?",
    "answer": "After first installment payment"
  },
  {
    "title": "I Want To Understand More About The Design Process",
    "question": "Can we speak to a consultant before buying the services?",
    "answer": "Yes"
  },
  {
    "title": "I Want To Understand More About The Design Process",
    "question": "When does a architect get involved in the process?",
    "answer": "After Payment"
  },
  {
    "title": "I Want To Understand More About The Design Process",
    "question": "Can we speak to a consultant before buying the services?",
    "answer": "Sure"
  },
].obs;


