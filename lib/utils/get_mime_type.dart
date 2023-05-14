String getMimeType(String? extension) {
  switch (extension) {
    case "pdf":
      return 'application/pdf';

    case "doc":
      return 'application/msword';

    case "docx":
      return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';

    case "png":
      return 'image/png';

    case "jpg":
      return 'image/jpeg';

    default:
      return "";
  }
}
