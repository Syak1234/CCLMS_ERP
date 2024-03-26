class InstallDetails {
  // String memo_id = '';
  // String payable_amount = '';
  // String received_amount = "";
  // String in_words = '';
  // String discount = '';
  // String fine = '';
  // String due = '';
  // String received_date = '';
  // String deposit_to = '';
  // String received_in = '';
  // String next_date = '';

  // InstallDetails(
  //     {required this.memo_id,
  //     required this.payable_amount,
  //     required this.received_amount,
  //     required this.in_words,
  //     required this.discount,
  //     required this.fine,
  //     required this.due,
  //     required this.received_date,
  //     required this.deposit_to,
  //     required this.received_in,
  //     required this.next_date});

  String fees_structure_id = '';
  String id = '';
  String status = "";
  String fees_type = '';
  String due_date = '';
  int amount = 0;
  String created_at = '';
  String updated_at = '';
  int payamount = 0;
  int fine = 0;

  InstallDetails({
    required this.fees_structure_id,
    required this.id,
    required this.status,
    required this.fees_type,
    required this.due_date,
    required this.amount,
    required this.created_at,
    required this.updated_at,
    required this.payamount,
    required this.fine,
  });
}
