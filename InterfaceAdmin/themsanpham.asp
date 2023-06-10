<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Admin</a></li>
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Quản Lý Sản Phẩm</a></li>
                    <li class="breadcrumb-item active">Thêm Sản Phẩm</li>
                </ol>
            </div>
            <h4 class="page-title">Thêm Sản Phẩm</h4>
        </div>
    </div>
</div>  
<html>
<head>
    <title>Add Products</title>
    <meta charset="utf-8">
</head>
<body>
    <h1>Add Product</h1>

    <form method="post" action="" >
        <!-- Các trường thông tin sản phẩm -->

        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="productname" class="form-label">Productname</label>
                    <input class="form-control" type="text" placeholder="Nhập tên sản phẩm" id="productname" name="productname" required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="fisrtday" class="form-label">Fisrtday</label>
                    <input class="form-control" type="date" placeholder="Enter your last name" id="fisrtday" name="fisrtday" required>
                </div>
            </div>
        </div> <!-- end row -->
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input class="form-control" type="text" placeholder="Nhập giá sản phẩm" id="price" name="price" required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="discount" class="form-label">Discount</label>
                    <input class="form-control" type="text" placeholder="Giảm giá" id="discount" name="discount" required>
                </div>
            </div>
        </div> <!-- end row -->
        <div class="row">
            <div class="col-12">
                <div class="mb-3 mt-3">
                    <label for="introduce" class="form-label">Introduce</label>
                    <textarea class="form-control" type="text" id="introduce" rows="3" placeholder="Nhập thông tin sản phẩm" name="introduce" required></textarea>
                    
                </div>
            </div>
        </div> <!-- end row -->

        <div class="row mt-4">
            <div class="col-sm-6">
                <!-- Chọn ảnh sản phẩm -->
                <input type="file" name="photo" accept="image/*" required><br>
            </div> <!-- end col -->
            <div class="col-sm-6">
                <div class="text-sm-end">
                    <input class="btn btn-danger" type="submit" value="Lưu">
                </div>
            </div> <!-- end col -->
        </div> <!-- end row -->
    </form>

</body>
</html>
