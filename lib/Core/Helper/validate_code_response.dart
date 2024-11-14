class ValidateCodeResponse {
  static String showErorrResponse(int code) {
    String errorMessage = "";
    switch (code) {
      case 40103:
        errorMessage = "Bài này không thể xóa!";
        break;
      case 40009:
        errorMessage = "Mật khẩu ít nhất 8 ký tự!";
        break;
      case 40003:
        errorMessage = "File ảnh đang sai định dạng";
      case 40900:
        errorMessage = "Tài khoản đã tồn tại!";
        break;
      case 40901:
        errorMessage = "Email đã tồn tại!";
      case 40105:
        errorMessage = "Mật khẩu không chính xác!";
        break;
      case 40104:
        errorMessage = "Tài khoản không tồn tại!";
        break;
      default:
        errorMessage = "Lỗi hệ thống";
        break;
    }
    return errorMessage;
  }
}
