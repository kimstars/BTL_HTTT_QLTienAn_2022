namespace HTTT_QLTienAn.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DangKyNghi")]
    public partial class DangKyNghi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DangKyNghi()
        {
            ChiTietCatComs = new HashSet<ChiTietCatCom>();
            PhieuThanhToans = new HashSet<PhieuThanhToan>();
        }

        [Key]
        public int MaDangKy { get; set; }

        [Required]
        [StringLength(100)]
        public string LyDo { get; set; }

        public int? MaHocVien { get; set; }

        public int? MaLoaiNghi { get; set; }

        public int? MaDS { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayDi { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayVe { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietCatCom> ChiTietCatComs { get; set; }

        public virtual DanhSachRaNgoai DanhSachRaNgoai { get; set; }

        public virtual HocVien HocVien { get; set; }

        public virtual LoaiNghi LoaiNghi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuThanhToan> PhieuThanhToans { get; set; }
    }
}
