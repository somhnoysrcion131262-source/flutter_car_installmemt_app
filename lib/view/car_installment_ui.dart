import 'package:flutter/material.dart';

class CarInstallmentUi extends StatefulWidget {
  const CarInstallmentUi({super.key});

  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  final TextEditingController carPriceCtrl = TextEditingController();
  final TextEditingController interestCtrl = TextEditingController();

  int downPercent = 10;
  int period = 24;

  double result = 0.0;

  final List<int> downList = [10, 20, 30, 40, 50];
  final List<int> periodList = [24, 36, 48, 60, 72];

  void calculate() {
    if (carPriceCtrl.text.isEmpty || interestCtrl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('แจ้งเตือน'),
          content: const Text('กรุณาป้อนราคารถและอัตราดอกเบี้ย'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ตกลง'),
            ),
          ],
        ),
      );
      return;
    }

    double carPrice = double.parse(carPriceCtrl.text);
    double interest = double.parse(interestCtrl.text);

    
    double loan = carPrice - (carPrice * downPercent / 100);
    double totalInterest = (loan * interest / 100) * (period / 12);
    double monthly = (loan + totalInterest) / period;

    setState(() {
      result = monthly;
    });
  }

  void reset() {
    setState(() {
      carPriceCtrl.clear();
      interestCtrl.clear();
      downPercent = 10;
      period = 24;
      result = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CI Calculator'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'คำนวณค่างวดรถ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Container(
                width: 400,
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/33.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            


            const Text('ราคารถ (บาท)'),
            TextField(
              controller: carPriceCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '0.00',
              ),
            ),

            const SizedBox(height: 12),

            
            const Text('จำนวนเงินดาวน์ (%)'),
            Wrap(
              children: downList.map((e) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<int>(
                      value: e,
                      groupValue: downPercent,
                      onChanged: (value) {
                        setState(() {
                          downPercent = value!;
                        });
                      },
                    ),
                    Text('$e'),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

         
            const Text('ระยะเวลาผ่อน (เดือน)'),
            DropdownButtonFormField<int>(
              value: period,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: periodList.map((e) {
                return DropdownMenuItem<int>(
                  value: e,
                  child: Text('$e เดือน'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  period = value!;
                });
              },
            ),

            const SizedBox(height: 12),

          
            const Text('อัตราดอกเบี้ย (%/ปี)'),
            TextField(
              controller: interestCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '0.00',
              ),
            ),

            const SizedBox(height: 16),

          
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: calculate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('คำนวณ'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text('ยกเลิก'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade50,
              ),
              child: Column(
                children: [
                  const Text('ค่างวดรถต่อเดือนเป็นเงิน'),
                  const SizedBox(height: 10),
                  Text(
                    result.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('บาทต่อเดือน'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
