import { useMUD } from "./MUDContext";
import React, { useEffect, useState } from "react";
import "./styles.css";

export const App = () => {
  const {
    systemCalls: { getChecks, toggleCheck },
  } = useMUD();

  const [records, setRecords] = useState({});
  useEffect(() => {
    const fetchRecords = async () => {
      const records = await getChecks();
      setRecords(records);
    };

    fetchRecords();
  }, [records]);

  return (
    <>
      <button onClick={toggleCheck}>Hello!</button>
      <table class="table-auto w-full border-collapse border border-gray-200">
        {Object.entries(records).map((record) => {
          const [id, data] = record;
          return (
            <tr>
              <td>{data["fields"]["addr"]}</td>
              <td>{JSON.stringify(data["fields"]["check"])}</td>
            </tr>
          );
        })}
      </table>
    </>
  );
};
