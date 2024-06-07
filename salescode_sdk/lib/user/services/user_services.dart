
import '../../auth/services/auth_state.dart';
import '../../db/services/database/database_service_app.dart';
import '../models/user_info_ui.dart';
import '../models/user_ui.dart';

abstract class UserServices {
  DatabaseServiceApp databaseService = DatabaseServiceApp();
  AuthState authState = AuthState();
  
  UserUI getUserDetails() {
    List<UserUI> userList = getUserList();
    if (userList.isEmpty) {
      return getDefaultUser();
    }
    return userList.first;
  }

  List<UserUI> getUserList();

  String setActiveOutletCode(String outletCode);

  String? getOrderSeq();

  bool setOrderSeqToNull();
  // UserUI toUserUI(dynamic e);
  bool setOrderSeq({required String orderSeq});

  List<UserInfoUI> getAllUser();

  UserUI getDefaultUser() {
    return UserUI(
        name: '',
        immediateParent: '',
        loginId: 'NA',
        designation: '',
        lob: authState.lob,
        locationHierarchy: '',
        mobile: '',
        verified: '',
        dialCode: '',
        email: '',
        address: '',
        userAccountId: '',
        roles: [],);
  }

  List<UserInfoUI> getSalesReps();

  // void setActiveSalesRep({required String salesRepId});

  // String getActiveSalesRep();

  void setUser(UserUI userUi);

  void emptySalesRepList();

  bool showWDcode(UserUI user); 

}
