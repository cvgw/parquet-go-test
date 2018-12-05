package main

import (
	"log"

	"github.com/xitongsys/parquet-go/ParquetReader"
	"github.com/xitongsys/parquet-go/ParquetWriter"
	"github.com/xitongsys/parquet-go/parquet"
)

func main() {
	ParquetTest()
}

type tester struct {
	Hostgroup int64 `parquet:"name=hostgroup, type=INT64"`
}

func ParquetTest() ([]byte, error) {
	fw, err := ParquetFile.NewMemFileWriter("flat.parquet")
	if err != nil {
		log.Println("Can't create mem file", err)
		return
	}

	test := tester{99}

	pw, err := ParquetWriter.NewParquetWriter(fw, new(tester), 1)
	if err != nil {
		log.Println("Can't create parquet writer", err)
		return
	}
	pw.RowGroupSize = 128 * 1024 * 1024 //128M
	pw.CompressionType = parquet.CompressionCodec_SNAPPY

	if err = pw.Write(test); err != nil {
		log.Println("Write error", err)
	}

	if err = pw.WriteStop(); err != nil {
		log.Println("WriteStop error", err)
		return
	}
	log.Println("Write Finished")
	fw.Close()

	///read
	fr, err := ParquetFile.NewMemFileReader("flat.parquet")
	if err != nil {
		log.Println("Can't open file")
		return
	}
	pr, err := ParquetReader.NewParquetReader(fr, new(tester), 4)
	if err != nil {
		log.Println("Can't create parquet reader", err)
		return
	}
	tests := make([]tester, 1)
	if err = pr.Read(&tests); err != nil {
		log.Println("Read error", err)
	}
	log.Println(stus)
	pr.ReadStop()
	fr.Close()

	return []byte{}, nil
}
