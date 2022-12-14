using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace HTTT_QLTienAn.Model
{
    public partial class QLTA_model : DbContext
    {
        public QLTA_model()
            : base("name=QLTA_model")
        {
        }

        public virtual DbSet<CanBo> CanBoes { get; set; }
        public virtual DbSet<ChiTietCatCom> ChiTietCatComs { get; set; }
        public virtual DbSet<ChiTietLoaiNghi> ChiTietLoaiNghis { get; set; }
        public virtual DbSet<DangKyNghi> DangKyNghis { get; set; }
        public virtual DbSet<DanhSachRaNgoai> DanhSachRaNgoais { get; set; }
        public virtual DbSet<DonVi> DonVis { get; set; }
        public virtual DbSet<DotThanhToan> DotThanhToans { get; set; }
        public virtual DbSet<HocVien> HocViens { get; set; }
        public virtual DbSet<LoaiHocVien> LoaiHocViens { get; set; }
        public virtual DbSet<LoaiNghi> LoaiNghis { get; set; }
        public virtual DbSet<Lop> Lops { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<PhieuThanhToan> PhieuThanhToans { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<TieuChuanAn> TieuChuanAns { get; set; }
        public virtual DbSet<c_ChoPheDuyet> c_ChoPheDuyet { get; set; }
        public virtual DbSet<CanBo_SuaNhapDS> CanBo_SuaNhapDS { get; set; }
        public virtual DbSet<Chung_GetPhanHoi> Chung_GetPhanHoi { get; set; }
        public virtual DbSet<DS_ChoPheDuyet> DS_ChoPheDuyet { get; set; }
        public virtual DbSet<DS_CTLopChoPheDuyet> DS_CTLopChoPheDuyet { get; set; }
        public virtual DbSet<DS_DaPheDuyet_cd> DS_DaPheDuyet_cd { get; set; }
        public virtual DbSet<DS_DaThanhToan> DS_DaThanhToan { get; set; }
        public virtual DbSet<ds_huy> ds_huy { get; set; }
        public virtual DbSet<DS_Lop_DaPheDuyet> DS_Lop_DaPheDuyet { get; set; }
        public virtual DbSet<DS_LopChoPheDuyet> DS_LopChoPheDuyet { get; set; }
        public virtual DbSet<DSLop_ChoPheDuyet> DSLop_ChoPheDuyet { get; set; }
        public virtual DbSet<getQSc> getQScs { get; set; }
        public virtual DbSet<Lop_DSHuy> Lop_DSHuy { get; set; }
        public virtual DbSet<NhaBep_ListCatCom> NhaBep_ListCatCom { get; set; }
        public virtual DbSet<NhaBep_ListThanhToan> NhaBep_ListThanhToan { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CanBo>()
                .HasMany(e => e.DonVis)
                .WithOptional(e => e.CanBo)
                .HasForeignKey(e => e.MaCBQL);

            modelBuilder.Entity<CanBo>()
                .HasMany(e => e.DanhSachRaNgoais)
                .WithOptional(e => e.CanBo)
                .HasForeignKey(e => e.MaCBc);

            modelBuilder.Entity<CanBo>()
                .HasMany(e => e.DanhSachRaNgoais1)
                .WithOptional(e => e.CanBo1)
                .HasForeignKey(e => e.MaCBd);

            modelBuilder.Entity<CanBo>()
                .HasMany(e => e.PhieuThanhToans)
                .WithOptional(e => e.CanBo)
                .HasForeignKey(e => e.MaCBNhaBep);

            modelBuilder.Entity<HocVien>()
                .HasMany(e => e.DanhSachRaNgoais)
                .WithOptional(e => e.HocVien)
                .HasForeignKey(e => e.MaLT);

            modelBuilder.Entity<HocVien>()
                .HasMany(e => e.PhanHois)
                .WithOptional(e => e.HocVien)
                .HasForeignKey(e => e.MaLopTruong);

            modelBuilder.Entity<PhieuThanhToan>()
                .HasMany(e => e.PhanHois)
                .WithRequired(e => e.PhieuThanhToan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.TenDangNhap)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.Quyen)
                .IsUnicode(false);

            modelBuilder.Entity<TieuChuanAn>()
                .Property(e => e.TenTCA)
                .IsUnicode(false);

            modelBuilder.Entity<Chung_GetPhanHoi>()
                .Property(e => e.PhanHoi)
                .IsUnicode(false);
        }
    }
}
