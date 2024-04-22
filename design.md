
#### Web Design

**Quản lý tag, role**
trang1:  input nhập để nhập tên , description
trang2: trang để xem tag. 1 Bảng tag sẽ hiện thị lên, bên phải có 2 action là Edit và Delete
trang3: trang edit. Sẽ hiện thị đầy đủ thông tin tag, có 1 nút Edit và Delete phía dứới 

**Quản lý dự án**
trang 1: Cho phép người dùng điền đầy đủ thông tin dự án
trang 2: Hiện thị 1 bảng bao gồm 1 số cột c thấy quan trọng. Bên phải có nút Edit và Delete
trang3: Trang edit. Sẽ hiện thị đầy đủ thông tin của dự án, có 1 nút Edit và Delete phía dứới 

**Trang Nhân viên**
trang 1: Điền thông tin của nhân viên và sẽ có thêm lựa chọn thêm Skills từ 1 cái bảng lọc tag (vd như hình dưới kia). 
trang 2: 1 Bảng hiện thị thông tin cơ bản của nhân viên. Bảng đó có tầm 5 cột để hiện thị Tên, Email, Dự án đang tham gia, Team đang tham gia, và Kĩ năng. (cột nào ko có dựu liệu thì hiện thị là "not Join". Bên phải có 3 nút, Detail, Edit, Delete
trang 3: Như các trang trên. Trang edit sẽ có thêm cột lựa chọn Skills như trang 1 
trang4: (Detail -> trang 4) Do bảng nhân viên có quá nhiều thông tin để hiện thị hết. Nên trang 4 sẽ lo phần hiện thị toàn bộ thông tin của nhân viên.  


**Trang Team**
trang 1: Điền thông tin cơ bản của team. Phía dưới cùng có nút xác nhận 
Bấm nút xác nhận sẽ chuyển tới Trang Chọn Thành Viên:
Giao diện gồm 2 phần. 

1) Phần thứ nhất ở trên là 1 Thanh Lọc thông tin. 
Cơ bản thì lọc theo kĩ năng nhé. Ở trên có 1 input cho phép cậu tra các tag skills 
VD: sau khi tra đc tag skill JS thì bảng phía dưới sẽ hiện thông tin cơ bản của nhân viên đó. Bao gồm cả kĩ năng của nhân viên. 
(VD Thiết kế: cột chứa tag kĩ năng của nhân viên nhìn như hình màu xám ở dưới)  

2) 1 Bảng thông tin ở dưới thiết kế giống hệt bảng ở trang 2 của nhân viên.
note trang 2 của nhân viên: 1 Bảng hiện thị thông tin cơ bản của nhân viên. Bảng đó có tầm 5 cột để hiện thị Tên, Email, Dự án đang tham gia, Team đang tham gia, và Kĩ năng. (Cộtt nào ko có dựu liệu thì hiện thị là "not Join". Bên phải có 3 nút, Detail, Edit, Delete 
*Ko phải giao diện nhưng mà t vẫn nói cho chi tiết: Các nút khi bấm vào thì cũng sẽ hướng tới các trang của nhân viên như bth.*

trang 2: có 1 bảng hiện thị thông tin. Bảng đó có tầm 5 cột để hiện thị Team_name, Team_Skills (cột này có thể hiện thị 1 tag thể thiện kĩ năng team đó chuyên môn.), Participation (nghĩa là số lượng nhân viên trong team hay còn gọi là number_of_employee), project_name (dự án mà team đó tham gia),

trang 3: Giao diện và quy trình edit giống như phần Tạo nhân viên ở trang 1. (vì nó cũng chỉ là tạo lại và thay thông tin)


**Feature Team cho Project** (thiết kế gần như tương tự Trang Team)
trang 1: Điền thông tin cơ bản của Project (mọi thông tin trong bảng project). Phía dưới cùng có nút xác nhận 
Bấm nút xác nhận sẽ chuyển tới Trang Chọn Team:
Giao diện gồm 2 phần. 

1) Phần thứ nhất ở trên là 1 Thanh Lọc thông tin. 
Cơ bản thì lọc theo kĩ năng nhé. Ở trên có 1 input cho phép cậu tra các tag skills 
VD: sau khi tra đc tag skill JS thì bảng phía dưới sẽ hiện thông tin cơ bản của Team. Bao gồm cả kĩ năng của nhân viên. 
(VD Thiết kế: cột chứa tag kĩ năng của nhân viên nhìn như hình màu xám ở dưới)  

2) Thiết kế Bảng giống kêt trang Team. Nhưng mà thay vì hiện thị thông tin nhân viên thì sẽ hiện thị thông tin Team
Giao diện bảng: Bảng hiện thị thông tin cơ bản của Team. Bảng đó có tầm 5 cột để hiện thị Team_name, Team_Skills (cột này có thể hiện thị 1 tag thể thiện kĩ năng team đó chuyên môn.), Participation (nghĩa là số lượng nhân viên trong team hay còn gọi là number_of_employee), project_name (dự án mà team đó tham gia), Bên phải có 3 nút, Detail, Edit, Delete 
*Các nút khi bấm vào thì cũng sẽ hướng tới các features của team như bth.*

trang2: Hiện thị 1 bảng để xem tổng quan các dự án. Bảng bao gồm tên name, number_of_employee, project_priority, start_data, end_date, project manager. Bên phải có 3 nút, Detail, Edit, Delete 

trang 3: Giao diện và quy trình edit giống như phần tạo dự án. (vì nó cũng chỉ là tạo lại và thay thông tin)

trang 4: khi bấm vào Detail sẽ hiện thị toàn bộ thông tin chi tiết của dự án đó. Bao gồm mọi thông tin của dự án và team tham gia dự án đó.